public class Accounts extends fflib_SObjectDomain  {
    public Accounts(List<Account> sObjectList) {
        super(sObjectList);
    }
    
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<sObject> sObjectList) {
            return new Accounts(sObjectList);
        }
    }
    

    public override void onBeforeUpdate(Map<Id,sObject> existingRecords) {
		String phrase = 'Domain classes rock!';
        for(Account account : (List<Account>) Records) {
            account.AnnualRevenue = phrase.getLevenshteinDistance(account.Description);
        }
    }
    
    public override void onApplyDefaults() {
         for (Account account : (List<Account>) Records) {
            account.Description = 'Domain classes rock!';
        }
    }   
}