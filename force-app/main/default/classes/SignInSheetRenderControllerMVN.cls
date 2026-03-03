public with sharing class SignInSheetRenderControllerMVN {
 @AuraEnabled(cacheable=true)
public static List<Account> getAccounts() {
return [SELECT Id,Name FROM Account]; 
} 
}