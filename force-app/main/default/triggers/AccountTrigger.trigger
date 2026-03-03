trigger AccountTrigger on Account (before Insert,after insert,before update,after update,before delete,after delete,after  undelete) {
   
    If(Trigger.isBefore && Trigger.isInsert){
        for(Account a: Trigger.new){
            if(a.ShippingCity==null){
                System.debug(a.ShippingCity);
            a.ShippingCity=a.BillingCity;
            }
            if(a.ShippingCountry==null){
          a.ShippingCountry=a.BillingCountry;
                    }
        }
    }
         
    If(Trigger.isAfter && Trigger.isInsert){
        List<Contact> con = new List<Contact>();
        for(Account a: Trigger.new){
          Contact c=new Contact();
            
            c.LastName=a.Name;
            c.AccountId=a.Id;
            c.MailingCity=a.ShippingCity;
            con.add(c);
        }
         if(con.size()>0){
             INSERT con;
         }
    }


    //An account should not be deleted
  If(Trigger.isBefore && Trigger.isDelete){
         for(Account accold : Trigger.Old){
             System.debug('working or not');
             if(accold.Active__c == 'Yes'){
                 
                 accold.addError('you cant delete');
                  
             }
         }  
    }
}