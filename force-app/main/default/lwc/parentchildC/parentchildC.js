import { api, LightningElement } from 'lwc';

export default class ParentchildC extends LightningElement {
    parentfunctionvalue;
    @api parentmsg;
    @api 
    runfromparent(){
     this.parentfunctionvalue='called';
    }
}