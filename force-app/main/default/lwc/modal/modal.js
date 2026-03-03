// accountModal.js
import { LightningElement, api } from 'lwc';

export default class AccountModal extends LightningElement {
    @api account;  // Account object passed in
    showModal = false;

    openModal() {
        this.showModal = true;
    }
    closeModal() {
        this.showModal = false;
    }
}