import { LightningElement, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
 
export default class BasicNavigationLWC extends NavigationMixin(LightningElement) {
 
    refUrl;
 
    connectedCallback() {
        this.caseHomePageRef = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Case',
                actionName: 'home'
            }
        };
        this[NavigationMixin.GenerateUrl](this.caseHomePageRef)
            .then(url => this.refUrl = url);
    }
 
    handleNavigationClick(evt) {
        evt.preventDefault();
        evt.stopPropagation();
        this[NavigationMixin.Navigate](this.caseHomePageRef);
    }
}