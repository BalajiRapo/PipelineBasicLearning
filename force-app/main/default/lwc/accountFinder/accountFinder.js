import { LightningElement, wire, track } from 'lwc';
import queryAccountsByRevenue from '@salesforce/apex/AccountListControllerLwc.queryAccountsByRevenue';

export default class AccountFinder extends LightningElement {
    @track annualRevenue = 100000; // Default value for testing
    @track accounts = [];
    @track error;

    @wire(queryAccountsByRevenue, { annualRevenue: '$annualRevenue' })
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
            this.error = undefined;
        } else if (error) {
            this.accounts = [];
            this.error = error;
        }
    }

    handleInputChange(event) {
        this.annualRevenue = event.target.value;
    }
}