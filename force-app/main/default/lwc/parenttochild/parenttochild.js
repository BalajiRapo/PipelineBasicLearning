import { LightningElement } from 'lwc';
export default class Parenttochild extends LightningElement {
prev(){
this.dispatchevent(new CustomEvent("previous"));
}
next(){
this.dispatchevent(new CustomEvent("next"));
}
}