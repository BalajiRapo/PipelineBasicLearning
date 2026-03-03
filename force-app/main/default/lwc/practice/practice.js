import { LightningElement, api, track } from 'lwc';
import { createRecordInputFilteredByEditedFields, updateRecord } from 'lightning/uiRecordApi';

export default class RecordUpdater extends LightningElement {
    @api recordId; // Record Id of the Account to update
    
    originalRecord = {
        fields: {
            Id: this.recordId,
            Name: 'Original Account Name',
            Phone: '1234567890',
            Industry: 'Technology'
        }
    };

    // Tracked values for the form
    @track editedName = this.originalRecord.fields.Name;
    @track editedPhone = this.originalRecord.fields.Phone;
    @track editedIndustry = this.originalRecord.fields.Industry;

    // Handle input changes
    handleNameChange(event) {
        this.editedName = event.target.value;
    }

    handlePhoneChange(event) {
        this.editedPhone = event.target.value;
    }

    handleIndustryChange(event) {
        this.editedIndustry = event.target.value;
    }

    // Handle the update logic
    handleUpdate() {
        alert(`Record ID: ${this.recordId}`);
        // Create recordInput object with updated fields
        const recordInput = {
            fields: {
                Id: this.recordId,
                Name: this.editedName,
                Phone: this.editedPhone,
                Industry: this.editedIndustry
            }
        };

        // Filter out unchanged fields
        const filteredRecordInput = createRecordInputFilteredByEditedFields(recordInput, this.originalRecord);

        // Call updateRecord
        updateRecord(filteredRecordInput)
            .then(() => {
            })
            .catch(error => {
                console.error(error);
            });
    }


}