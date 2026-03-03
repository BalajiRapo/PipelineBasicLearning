import { LightningElement, api } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import acc from '@salesforce/schema/Account';

export default class RecordEditFormExample extends LightningElement {
    // Expose a field to make it available in the template
    nameField = NAME_FIELD;

    // Flexipage provides recordId and objectApiName
    @api recordId='0015i00000uGARiAAO';
    @api obj=acc;
}