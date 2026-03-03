public class CustomControllerForSave {
    public string accName{get;set;}
    public Integer NoOfEmp{get;set;}
    public string conName{get;set;}
    public string conEmail{get;set;}
    public string oppName{get;set;}
    public Integer oppAmount{get;set;}
    public string Description{get;set;}
    public string Industry{get;set;}
    public string dropdownValue{get;set;}    
    public string id{get;set;}
    public List<String> lstSections { get; set; }
    public CustomControllerForSave(){ 
        lstSections = new List<String>();
    }  

    List<selectOption> options = new List<selectOption>();
	    public List<selectOption> getdynamiclist() {
		for(Product2 p : [select Name from Product2]) {
			options.add(new selectOption(p.Name,p.Name));
        }
		return options;
	   }
   
       public PageReference addSection() {
        lstSections.add('dummy');
        return null;
          }
    
    public void saveRecord(){
        try{
        Account a=new Account(Name=accName,Description=Description,Industry=Industry, NumberOfEmployees=NoOfEmp);
        insert a;
        Contact c=new Contact(Lastname=conName,Email=conEmail,accountid=a.id);
        Opportunity o=new Opportunity(Name=oppName,Amount=oppAmount, accountid=a.id, StageName='Prospecting',closeDate=system.Today());
        insert o;
        insert c;
    
         Product2 pro=new Product2(name ='imrapo',IsActive=true);
         insert pro;
         PriceBook2 customprice=new PriceBook2(name='rapo',IsActive=true);
         insert customprice;
         PriceBook2 standardPb=[select id from Pricebook2 where isStandard=true];
         PriceBookEntry pbeStandard=new PriceBookEntry(Product2Id=pro.Id,PriceBook2Id=standardPb.Id,isActive=true,UnitPrice=1);
         insert pbeStandard;
         PricebookEntry pbe=new PriceBookEntry(Product2Id=pro.Id,PriceBook2Id=customprice.Id,isActive=true,UnitPrice=1);
         insert pbe;
          system.debug('sd');
          OpportunityLineItem lineitem=new OpportunityLineItem(OpportunityId=o.id,PriceBookEntryId=pbe.Id,Quantity=2,Unitprice=23);
         insert lineitem;
        }
        catch(Exception e){
            System.debug('occurs'); 
        }
        
      }
   
 
}