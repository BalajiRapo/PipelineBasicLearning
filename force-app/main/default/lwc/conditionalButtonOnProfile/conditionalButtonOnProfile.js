import { LightningElement,wire } from 'lwc';
import getProfile from '@salesforce/apex/DisplayButton.displayButtonValue';
export default class ConditionalButtonOnProfile extends LightningElement {
    display=false;
    profileName;
    error;

    @wire(getProfile)
    wiredRes({data,error}){
        if(data){
                console.log('enters');
            this.profileName=data;
            console.log(data);
            if( this.profileName == 'System Administrator'){
                console.log('true');
                this.display =true;
            }
        }
        else{
            this.error=error;
        }
    }
}