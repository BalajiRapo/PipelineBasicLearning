// accountContactsLazyLoad.js
import { LightningElement, api, track } from 'lwc';
import getContacts from '@salesforce/apex/AccountContactsLazyLoadController.getContacts';

export default class AccountContactsLazyLoad extends LightningElement {
    @api recordId; // record page provides this automatically
    @track data = [];
    @track columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Email', fieldName: 'Email' },
        { label: 'Phone', fieldName: 'Phone' }
    ];

    lastId = null;
    batchSize = 50;
    isLoading = false;
    allLoaded = false;

    connectedCallback() {
        this.loadMoreData();
    }

    loadMoreData() {
        if (this.isLoading || this.allLoaded) return;

        this.isLoading = true;

        getContacts({ lastId: this.lastId, batchSize: this.batchSize })
            .then(result => {
                if (result.length > 0) {
                    this.data = [...this.data, ...result];
                    this.lastId = result[result.length - 1].Id; // store last record
                } else {
                    this.allLoaded = true;
                }
                this.isLoading = false;
            })
            .catch(error => {
                console.error(error);
                this.isLoading = false;
            });
    }

    handleLoadMore() {
        this.loadMoreData();
    }
}