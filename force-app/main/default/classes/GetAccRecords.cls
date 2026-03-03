public with sharing class GetAccRecords {
    @AuraEnabled
    public static List<Account> getAcc(Integer offset){
        List<Account> accs=new List<Account>();
        if(Account.sObjectType.getDescribe().isAccessible()){
        accs= [select id,name from Account limit 25 offset :offset];
        }
       return accs;
    }
}