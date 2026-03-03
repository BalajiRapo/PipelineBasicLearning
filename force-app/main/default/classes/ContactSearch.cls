public class ContactSearch {
    public static list<Contact> searchForContacts(String lastName,String postalCode){
        List<Contact> Contacts=[Select Id,Name from Contact where LastName =:lastName and MailingPostalCode =:postalCode];
return Contacts;
    }
}