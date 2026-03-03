import { LightningElement,wire,track } from 'lwc';
import getacccon from '@salesforce/apex/AccountController.getAccsCon';
export default class LazyLoadNoDT extends LightningElement {
   @track accounts=[];
   @wire(getacccon)
   wiredaccs({ error,data }){
    if(data){
     this.accounts=data;
   }
   if(error){
    console.log(error);
   }
    }

}