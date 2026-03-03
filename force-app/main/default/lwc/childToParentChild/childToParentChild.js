import { LightningElement } from 'lwc';

export default class ChildToParentChild extends LightningElement {
    sendtoparent(){
        this.dispatchEvent(
            new CustomEvent(
                "sendingevent",
                {
                detail:
                {
                    message:'sending message'
                }
            }
            )
        );
    }
}