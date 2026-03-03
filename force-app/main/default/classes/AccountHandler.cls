public class AccountHandler {
    public static Account insertNewAccount(String AccountName){
        try{
            Account newact=new Account(Name=AccountName);
            insert newact;
            return newact;
        }    
        catch(DmlException e){
            System.debug('A DML exception has occured: ' +e.getMessage());
            return null;
        }
    }
}