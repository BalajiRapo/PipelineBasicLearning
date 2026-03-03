public with sharing class AccountDetailsController {
    public Account accountRec { get; set; }

    public AccountDetailsController() {
        Id accId = ApexPages.currentPage().getParameters().get('id');
        if (accId != null) {
            accountRec = [SELECT Id, Name, Industry, Phone, Website 
                          FROM Account 
                          WHERE Id = :accId 
                          LIMIT 1];
        }
    }

}