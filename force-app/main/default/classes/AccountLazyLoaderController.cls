public with sharing class AccountLazyLoaderController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(Integer pageSize, Integer pageNumber) {
        Integer offset = (pageNumber - 1) * pageSize;
        return [
            SELECT Id, Name, Industry
            FROM Account
            ORDER BY CreatedDate DESC
            LIMIT :pageSize
            OFFSET :offset
        ];
    }
}