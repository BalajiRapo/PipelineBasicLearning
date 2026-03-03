public class StoreMultipleRecordsAtOnce {
public List<Account> ListAccount{get; set;}
public List<contact> ListContact{get; set;}
public List<Opportunity> ListOpportunity{get; set;} 

public List<product2> ListProduct{get; set;}

    
    public StoreMultipleRecordsAtOnce(){ 
        ListAccount = new List<Account>();
        ListContact = new List<Contact>();
        ListOpportunity = new List<Opportunity>();
        Listproduct = new List<product2>();
        }
   public void addAccount(){
        Account acc= new Account();
        ListAccount.add(acc); 
     }
    public void addContact(){
         Contact con=new Contact();
        ListContact.add(con);
        
    }
    public void addOpportunity(){
        Opportunity opp=new Opportunity();
        opp.StageName='Prospecting';
        opp.closeDate=system.Today();
        ListOpportunity.add(opp);
      
    }
 public  void saveAccount(){  
   
     insert ListAccount;
      
    }
     public void saveContact(){
          insert ListContact;
    }
    public void saveOpportunity(){
        insert ListOpportunity;
         }
     public void addOpp(){
        product2 acc= new product2();
        ListProduct.add(acc);
       }
     public void saveOpp(){  
      insert ListProduct;           
    }
}