import { LightningElement } from 'lwc';

export default class Gettersetterreactive extends LightningElement {
    firstName = '';
    lastName = '';

    // ✅ Getter for computed full name
    get fullName() {
        return `${this.firstName} ${this.lastName}`;
    }

    // ✅ Handle input changes
    handleChange(event) {
        const field = event.target.dataset.field;
        this[field] = event.target.value;
    }

    // ✅ Example setter logic: set default values on button click
    setFullName() {
        this.firstName = 'John';
        this.lastName = 'Doe';
    }
}