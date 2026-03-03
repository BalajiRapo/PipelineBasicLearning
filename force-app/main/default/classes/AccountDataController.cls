public with sharing class AccountDataController {
    @AuraEnabled(cacheable=false)
    public static List<Account> getAccounts(Integer limitSize, Integer offsetSize) {
        return [
            SELECT Id, Name, Industry, Phone
            FROM Account
            ORDER BY CreatedDate DESC
            LIMIT :limitSize
            OFFSET :offsetSize
        ];
    }

    @AuraEnabled
    public static void updateAccounts(List<Account> accounts) {
        update accounts;
    }

    @AuraEnabled
    public static void deleteAccount(Id accountId) {
        delete [SELECT Id FROM Account WHERE Id = :accountId];
    }
}