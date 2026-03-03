import { LightningElement } from 'lwc';

export default class ParentToC extends LightningElement {
    parentvalue='test';
    pass(){
        this.parentvalue ='updated test';
        console.log(this.parentvalue);
        this.passfunction();
        console.log('called passfunction');
    }
    passfunction(){
        const t= this.template.querySelector('c-parentchild-c');
        t.runfromparent();
    }
}