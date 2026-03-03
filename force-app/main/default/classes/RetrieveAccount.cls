public with sharing class RetrieveAccount{ 
public List<Account> records {get; set;} 
public RetrieveAccount(){ 
records = [select Name, AccountNumber from Account  WHERE Id = :ApexPages.currentPage().getParameters().get('id')]; 
} 
}