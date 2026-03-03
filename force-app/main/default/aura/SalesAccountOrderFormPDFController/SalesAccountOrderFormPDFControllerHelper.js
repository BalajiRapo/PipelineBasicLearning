({
    SendOrderPdfHelper : function(component,event,helper) {
        var recId = component.get('v.recordId');
        // alert('recId ' + recId);
        var action = component.get("c.attachedOrderFile");
        action.setParams({ "orderId" : recId });
        action.setCallback(this, function(response) {
            var state = response.getState(); //fetch the response state
            //alert('state11 ' + state);
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                //alert('result ' + JSON.stringify(result));
                $A.get("e.force:closeQuickAction").fire();
                $A.get('e.force:refreshView').fire();
                
                if(result == "Attachment Created Success"){                   
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'Success',
                        type: 'success',    
                        message: 'Attachment Creatted Succussfully',  
                    });
                    toastEvent.fire();
                }
                
                
            }
            else {               
            }
        });
        $A.enqueueAction(action); 
    }
})