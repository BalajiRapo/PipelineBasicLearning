public with sharing class TestPractice {
    public TestPractice() {
       
    }
    @AuraEnabled(cacheable=true)
public static List<Account> getAccounts(String lastId, Integer batchSize) {
    if(batchSize == null) batchSize = 50;

    if(String.isBlank(lastId)) {
        return [
            SELECT Id, Name, Industry, Phone
            FROM Account
            ORDER BY Id
            LIMIT :batchSize
        ];
    } else {
        return [
            SELECT Id, Name, Industry, Phone
            FROM Account
            WHERE Id > :lastId
            ORDER BY Id
            LIMIT :batchSize
        ];
    }
}

}