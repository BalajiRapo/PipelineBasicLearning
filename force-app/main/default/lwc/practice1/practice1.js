import { LightningElement,api,wire } from 'lwc';
import getrecs from '@salesforce/apex/lwcclass.getrecs';

export default class Practice1 extends LightningElement {
    
  @api recordId;
  accounts;

  change(event){
    this.recordId=event.target.value;
    console.log('enters2'+recordId);
  }

  @wire(getrecs)
wiredAccounts({error, data}){
        if(data){
            this.accounts = data;
            this.error = undefined;
        }
        else{
            this.accounts = data;
        }
    }
  
}