public with sharing class AccountContactsLazyLoadController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getContacts(String lastId, Integer batchSize) {
        if(batchSize == null) batchSize = 5;
//test
//Changes made
//Second version of changes
        if(String.isBlank(lastId)) {
            return [
                SELECT Id, Name, Phone
                FROM Account
                ORDER BY Id
                LIMIT :batchSize
            ];
        } else {
            return [
                SELECT Id, Name, Phone
                FROM Account
                where Id > :lastId
                ORDER BY Id
                LIMIT :batchSize
            ];
        }
    }
}