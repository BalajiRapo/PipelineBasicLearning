import { LightningElement } from 'lwc';
import  LightningToast  from 'lightning/toast';
import ToastContainer from 'lightning/toastContainer'

export default class ToastUsingshow extends LightningElement {
    connectedCallback(){
        const t=ToastContainer.instance();
        t.maxToasts=5;
        t.toastPosition="top-right";
    }
    displayToast(){
        LightningToast.show(
            {
        label:"test {0}",
        labelLinks:[
            {
               url: "https://conexus-4a-dev-ed.lightning.force.com/lightning/r/Account/0015i00000uGARiAAO/view",
               label: "open record",
            },

        ],

        message:"test message",
        variant:"success",
        mode:"sticky"
            }

        )

    }
}