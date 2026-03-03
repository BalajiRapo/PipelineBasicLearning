public with sharing class lwcclass {
    @AuraEnabled(cacheable=true)
    public static List<Account> getrecs(String accid) {
         String key='%'+accid+'%';
        system.debug('Account data: ' + accid);
        if (String.isBlank(accid)) {
            return new List<Account>(); 
        }
        return [SELECT Id, Name FROM Account WHERE Id = :key];
    }
}