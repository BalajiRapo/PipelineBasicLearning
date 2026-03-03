public with sharing class LWCFirst {
    @AuraEnabled(cacheable = true)
    public static List<Account> getAllAccounts(id recordId , integer searchTerm){
        List<Account> accList =[Select Id,Name,Ownership,
                                Industry,Rating,ParentId,Phone FROM Account 
                                limit : searchTerm
                                ];
        system.debug('count'+searchTerm);
        system.debug('id'+recordId);
        return accList;
    }

    @AuraEnabled(cacheable = true)
    public static List<Account> gettest(id recordId){
        List<Account> accList1 =[Select Id,Name,Ownership,
                                Industry,Rating,ParentId,Phone FROM Account  where id =: recordId];
        system.debug('ids'+recordId);
        return accList1;
    }
}