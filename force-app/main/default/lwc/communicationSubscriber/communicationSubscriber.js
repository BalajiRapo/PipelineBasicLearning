import { LightningElement,wire } from 'lwc';
import {subscribe,MessageContext,releaseMessageContext} from 'lightning/messageService';
import MSG_CAN from '@salesforce/messageChannel/messagechannel11__c';
//publiser - CommunicationPublisher
//subscriber - CommunicationSUbscriber
export default class CommunicationSubscriber extends LightningElement {
subsciptionvalue=null;
@wire(MessageContext)
msgcon;



connectedCallback(){
this.subsciptionvalue = subscribe(
  this.msgcon,
  MSG_CAN,
  (message) =>this.handleMessage(message)
);
}
handleMessage(message){
    console.log(message);

}
}