public class lwcdemo {
    public integer mysearchtext {get; set;}  
    public static integer k {get; set;}  
    public void docount(){
        system.debug(mysearchtext);
        k=mysearchtext;
        getAccs();
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccs(){
       system.debug('count'+k);
       List<Account> acc=[select id,name from account limit : k];
       system.debug('value is'+acc);
       return acc;
    }
}