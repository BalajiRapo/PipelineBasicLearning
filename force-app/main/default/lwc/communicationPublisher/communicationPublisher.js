import { LightningElement, wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import MSG_CAN from '@salesforce/messageChannel/messagechannel11__c';

//publiser - CommunicationPublisher
//subscriber - CommunicationSUbscriber

export default class CommunicationPublisher extends LightningElement {
    msg = { Name: 'Test send' };

    @wire(MessageContext)
    messageContext;

    handlePublish() {
        publish(this.messageContext, MSG_CAN, this.msg);
        console.log('Message published:', this.msg);
    }
}