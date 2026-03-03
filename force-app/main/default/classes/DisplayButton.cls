public with sharing class DisplayButton {
    public DisplayButton() {

    }
  @AuraEnabled(Cacheable=true)
    public static string displayButtonValue(){
     return [select Profile.Name from user where id=:userinfo.getUserId()].profile.Name;      
     
    }
}