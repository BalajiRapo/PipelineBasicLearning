public with sharing class DataTable {
    public DataTable() {

    }
    @AuraEnabled(cacheable=true)
    Public static List<Account> getAccounts(){
        return [select id,name from Account];
    }
    @AuraEnabled
    public static void updateAcc(List<Account> accs){
        update accs;
    }
}