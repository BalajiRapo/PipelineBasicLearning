import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//if we want to rename import module name, use as
//import { ShowToastEvent as Toast } from 'lightning/platformShowToastEvent';



export default class ToastMessages extends LightningElement {
    onsuccess(){
       this.dispatchEvent(new ShowToastEvent(
        {
            title: "successful",
            message: " successfully enrolled",
            variant: "success"
        }
       ))
    }
    onwarning(){
    this.dispatchEvent(
        new ShowToastEvent(
            {
                title: "warning",
                message : "warning message",
                variant: "warning"
            }
        )
    )
    }
    onerrors(){
       this.dispatchEvent(
        new ShowToastEvent(
            {
            title:"error",
            message:"some issue",
            variant:"error"
            }

        )
       )
    }
    oninfo(){
        this.dispatchEvent(
            new ShowToastEvent(
                {
            title:"info",
            message:"information",
            variant:"info"
                }

        )
        )
    }
}