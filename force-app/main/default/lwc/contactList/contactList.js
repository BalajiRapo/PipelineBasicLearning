import { LightningElement, wire } from 'lwc';
import getContactList from '@salesforce/apex/AsyncExample.getContactList';
import { reduceErrors } from 'c/ldsUtils'; // ✅ Import reduceErrors

const COLUMNS = [
    { label: 'First Name', fieldName: 'FirstName' },
    { label: 'Last Name', fieldName: 'LastName' },
    { label: 'Email', fieldName: 'Email' }
];

export default class ContactList extends LightningElement {
    columns = COLUMNS;

    @wire(getContactList)
    contacts;

    // ✅ Getter for errors
    get errors() {
        return this.contacts.error ? reduceErrors(this.contacts.error).join(', ') : null;
    }
}