// childDatatable.js
import { LightningElement, api } from 'lwc';

export default class ChildDatatable extends LightningElement {
    @api columns;
    @api data;

    handleSave(event) {
        this.dispatchEvent(new CustomEvent('save', { detail: event.detail }));
    }

    handleRowAction(event) {
        this.dispatchEvent(new CustomEvent('rowaction', { detail: event.detail }));
    }

    @api clearDraftValues() {
        const datatable = this.template.querySelector('lightning-datatable');
        if (datatable) {
            datatable.draftValues = [];
        }
    }
}