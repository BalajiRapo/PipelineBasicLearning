import { LightningElement,api,track,wire } from 'lwc';
import getAllAccounts from '@salesforce/apex/LWCFirst.getAllAccounts';
import gettest from '@salesforce/apex/LWCFirst.gettest';
export default class LWCFirst extends LightningElement {
    @api records;
    @api errors;
    @api records1;
    @api errors1;
    @api recordId;
    handleSearch(event) {
        let searchTerm = event.target.value;
        getAllAccounts({recordId: this.recordId, searchTerm})
        .then(result => {
            this.records = result;
        })
        .catch(error => {
            this.error = error;
        });
        gettest({recordId: this.recordId})
        .then(result1 => {
            this.records1 = result1;
        })
        .catch(error1 => {
            this.error1 = error1;
        });
        
       }
    
}