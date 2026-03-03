@isTest
public class StoreMultipleRecordsAtOnce_test {
    
    @isTest
    private static void save(){
        Account aw=new Account(Name='Rt');
        Account aw1=new Account(Name='Rtf');
        StoreMultipleRecordsAtOnce c=new StoreMultipleRecordsAtOnce();
        c.ListAccount.add(aw); 
        c.ListAccount.add(aw1); 
        c.saveAccount();
     }
    @isTest
     private static void savecontact(){
        Contact cw=new Contact(Lastname='Ram');
        Contact cw1=new Contact(Lastname='Rapo');
        StoreMultipleRecordsAtOnce c=new StoreMultipleRecordsAtOnce();
        c.Listcontact.add(cw); 
        c.Listcontact.add(cw1); 
        c.saveContact();
     }
      @isTest
     private static void saveOpportunity(){
        Opportunity op=new Opportunity(Name='Ram', Amount=900, StageName='Prospecting',closeDate=system.Today()); 
        Opportunity op1=new Opportunity(Name='Ramarao',Amount=909 , StageName='Prospecting',closeDate=system.Today());
        StoreMultipleRecordsAtOnce c=new StoreMultipleRecordsAtOnce();
        c.ListOpportunity.add(op); 
        c.ListOpportunity.add(op1); 
        c.saveOpportunity();
     }
      @isTest
     private static void saveOpp(){
        product2 prod=new product2(Name='Ram',Opportunity__c='0065i000007ZuEPAA0'); 
        product2 prod1=new product2(Name='Ramarao',Opportunity__c='0065i000007ZuEPAA0');
        StoreMultipleRecordsAtOnce c=new StoreMultipleRecordsAtOnce();
        c.ListProduct.add(prod); 
        c.ListProduct.add(prod1); 
        c.saveOpp(); 
     }
      @isTest
    private static void addAccount(){
        Account aw=new Account(Name='Rt');
        StoreMultipleRecordsAtOnce c=new StoreMultipleRecordsAtOnce();
        c.ListAccount.add(aw); 
        c.addAccount();
     }
     @isTest
     private static void contact(){
        Contact cw=new Contact(Lastname='Ram');
        StoreMultipleRecordsAtOnce c=new StoreMultipleRecordsAtOnce();
        c.Listcontact.add(cw); 
        c.addContact();
     }
    @isTest
     private static void opportunity(){
        Opportunity op=new Opportunity(Name='Ram', Amount=900, StageName='Prospecting',closeDate=system.Today()); 
        StoreMultipleRecordsAtOnce c=new StoreMultipleRecordsAtOnce();
        c.ListOpportunity.add(op);
        c.addOpportunity();
     }
     @isTest
     private static void product(){
        product2 prod=new product2(Name='Ram',Opportunity__c='0065i000007ZuEPAA0'); 
        StoreMultipleRecordsAtOnce c=new StoreMultipleRecordsAtOnce();
        c.ListProduct.add(prod); 
        c.addOpp(); 
     }
    
}