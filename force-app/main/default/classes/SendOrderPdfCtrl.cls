public class SendOrderPdfCtrl {
   @AuraEnabled
    public static String attachedOrderFile(String orderId){
        Account orderItemList = [Select Id, Name, Phone, Industry, Rating, Description, Type, Website From Account Where Id=:orderId ];
                  
         if((orderItemList.Industry=='Technology') && (orderItemList.Type=='Technology Partner')){
            PageReference PDf =  Page.SalesAccountOrderFormPDFVfp;//Replace attachmentPDf with the page you have rendered as PDF
            PDf.getParameters().put('Id', orderId);
            PDf.setRedirect(true);
            Attachment attach = new Attachment();
            Blob b ;
            b = PDf.getContent();
            attach.Body = b;
            attach.Name = orderItemList.Name +'.pdf';
            attach.IsPrivate = false;
            attach.ParentId = orderId;
            insert attach;
                    
                    system.debug('attach### ' + attach);
                    system.debug('orderItemList### ' + orderItemList);  
             return 'Attachment Created Success';
               
           }else{
              return 'Attachment Created Failed';
           }
         
        }
}