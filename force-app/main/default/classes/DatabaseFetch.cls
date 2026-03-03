public class DatabaseFetch {
    public static void myFetch(){
       String id='select Name';
       String []fieldsWeWant=new List<String>();
       fieldsWeWant.add('Phone');
  
       String ObjectName='Account';
        
        for(String f:fieldsWeWant){
            id+=','+f;
        }
        id+=' from '+ObjectName;
        List<sObject> result=Database.Query(id);
       System.debug(result);
    }
}