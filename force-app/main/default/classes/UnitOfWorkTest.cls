@IsTest
public class UnitOfWorkTest {
    @IsTest
    static void challengeComplete() {
        // Prepare Accounts
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 100; i++) {
            accounts.add(new Account(Name = 'Account ' + i));
        }
        insert accounts;

        // Prepare Contacts and Notes
        List<Contact> contacts = new List<Contact>();
        List<Note> notes = new List<Note>();
        
            for (Integer j = 0; j < 400; j++) { // Create 5 contacts per account
                Contact con = new Contact(FirstName = 'First ' + j, LastName = 'Last ' + j, AccountId = accounts[0].Id);
                contacts.add(con);
             
            }
        for (Integer j = 0; j < 500; j++) { // Create 5 contacts per account
            
                Note note = new Note(Title = 'Note ' + j, Body = 'Test Body', ParentId = accounts[0].Id);
                notes.add(note);
            }
        
        insert contacts;


        insert notes;

        // Assertions
        System.assertEquals(100, [Select Id from Account].size());
System.assertEquals(500, [Select Id from Contact].size());
System.assertEquals(500, [Select Id from Note].size());
        fflib_SObjectUnitOfWork s=new fflib_SObjectUnitOfWork();
        s.commitWork();
    }
}