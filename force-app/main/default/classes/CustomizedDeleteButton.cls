public class CustomizedDeleteButton {
 
 public void DeleteTheRecord(){
         if(userinfo.getProfileId()=='00e5i000000hOANAA2'){
   ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.Warning, 'You dont have permissions to delete the record');
     Apexpages.addMessage(msg);    
 }
     else{
         ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.info, 'Yes you have permissions to delete the record');
         Apexpages.addMessage(msg);   

     }
}
}