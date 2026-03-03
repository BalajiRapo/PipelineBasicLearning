import { LightningElement, track } from 'lwc';

export default class CssSpinner extends LightningElement {
    @track accName = '';
    @track isSaving = false;

    handleChange(event) {
        this.accName = event.target.value;
    }

    saveAccount() {
        this.isSaving = true;

        // simulate save (2 seconds)
        setTimeout(() => {
            this.isSaving = false;
            alert('Saved ✅ ' + this.accName);
        }, 2000);
    }
}