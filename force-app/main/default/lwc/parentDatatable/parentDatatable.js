// parentDatatable.js
import { LightningElement, track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountDataController.getAccounts';
import updateAccounts from '@salesforce/apex/AccountDataController.updateAccounts';
import deleteAccount from '@salesforce/apex/AccountDataController.deleteAccount';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ParentDatatable extends LightningElement {
    @track accounts = [];
    @track columns = [
        { label: 'Name', fieldName: 'Name', editable: false },
        { label: 'Industry', fieldName: 'Industry', editable: true },
        { label: 'Phone', fieldName: 'Phone', editable: false },
        {
            type: 'action',
            typeAttributes: { rowActions: [
                { label: 'Edit Industry', name: 'edit' },
                { label: 'Delete', name: 'delete' }
            ]}
        }
    ];

    pageSize = 5;
    pageOffset = 0;

    connectedCallback() {
        this.loadData();
    }

    loadData() {
        getAccounts({ limitSize: this.pageSize, offsetSize: this.pageOffset })
            .then(result => {
                this.accounts = result;
            })
            .catch(error => {
                this.showToast('Error', error.body.message, 'error');
            });
    }

    handleSave(event) {
        const updatedFields = event.detail.draftValues;
        updateAccounts({ accounts: updatedFields })
            .then(() => {
                this.showToast('Success', 'Records updated successfully', 'success');
                this.template.querySelector('c-child-datatable').clearDraftValues();
                this.loadData();
            })
            .catch(error => {
                this.showToast('Error updating records', error.body.message, 'error');
            });
    }

    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;

        if (actionName === 'delete') {
            deleteAccount({ accountId: row.Id })
                .then(() => {
                    this.showToast('Deleted', 'Record deleted', 'success');
                    this.loadData();
                })
                .catch(error => {
                    this.showToast('Error deleting record', error.body.message, 'error');
                });
        }
    }

    handleNext() {
        this.pageOffset += this.pageSize;
        this.loadData();
    }

    handlePrevious() {
        if (this.pageOffset >= this.pageSize) {
            this.pageOffset -= this.pageSize;
            this.loadData();
        }
    }

    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
    }
}