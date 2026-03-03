import { LightningElement } from 'lwc';

export default class ChildToParentParent extends LightningElement {
    fetchvalue;
    getvalue(event){
        console.log('enters parent event');
        console.log('Child message: ', event.detail.message);
        this.fetchvalue=event.balaji.test;
        //If we use single quotes in js message, we can retrieve like above..
        //If we use double quotes we need to use JSON.Stringfy
    }
}