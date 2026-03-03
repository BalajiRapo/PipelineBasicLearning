public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [
            SELECT Id, Name, Rating 
            FROM Account 
            order by name asc
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(Id accId) {
        return [
            SELECT Id, Name, Email, Phone 
            FROM Contact 
            WHERE AccountId = :accId
            LIMIT 50
        ];
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccsCon(){
        return [select id,name,(select id,name from Contacts) from Account];
    }
    @AuraEnabled(cacheable=true)
    public static Integer getAccsCount(){
        List<AggregateResult> r=[select count(id) from Account];
        return (Integer)r[0].get('total');
    }

}