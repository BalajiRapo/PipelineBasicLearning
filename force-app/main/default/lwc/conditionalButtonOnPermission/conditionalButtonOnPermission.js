import { LightningElement } from 'lwc';
import displayComp from '@salesforce/customPermission/DisplayComponent';
//import hasCustomPermission from '@salesforce/customPermission/DisplayComponent';
export default class ConditionalButtonOnPermission extends LightningElement 
{
display=false;
connectedCallback(){
    console.log(this.display);
 if(displayComp){
    console.log('enters');
      this.display=true;
 }
}

}