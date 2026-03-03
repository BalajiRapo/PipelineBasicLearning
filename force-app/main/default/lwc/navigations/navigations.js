import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';

export default class Navigations extends NavigationMixin(LightningElement) {
//homepage 
recordId ='0015i00000uGARiAAO';
homepage(){
this[NavigationMixin.Navigate](
{
    type: 'standard__namedPage',
    attributes:
    {
        pageName:'home'
    }
}
);
}
//Tab -->It is not object custom tabs, just for lightning pages
navigatetoTab(){
    this[NavigationMixin.Navigate](
        {
            type:'standard__navItemPage',
            attributes:
            {
                apiName:'Bike_Card'
            }
        }
    );
}
//Navigate to object page
navigatetoObjPage(){
    this[NavigationMixin.Navigate](
        {
            type :'standard__objectPage',
            attributes:
            {
                objectApiName:'Account',
                actionName:'list'
            },
            state: {
        filterName: 'NewLastWeek' // or 'Recent' or custom list view Id
             }
        }
        
        
    );
}
navToRecPage(){
this[NavigationMixin.Navigate](
    {
    type:'standard__recordPage',
    attributes:{
        recordId:'0015i00000uGARiAAO',
        objectApiName:'Account',
        actionName:'edit' //view,edit,clone
    }
    }
);    
}
//Related List
relatedlist(){
    this[NavigationMixin.Navigate](
        {
            type: 'standard__recordRelationshipPage',
            attributes:{
                objectApiName:'Account',
                recordId:'0015i00000uGARiAAO',
                relationshipApiName: 'Contacts',
                actionName:'view'
            }
            

        }
    );
}
cricbuzz(){
    this[NavigationMixin.Navigate](
        {
            type:'standard__webPage',
            attributes:
            {
                url:'https://www.cricbuzz.com/'
            }
        }
    );
}
callvf(){
    console.log('/apex/AccountDetails?id ='+this.recordId);
    this[NavigationMixin.Navigate](
    {
        type:'standard__webPage',
        attributes:
        {
            url:'/apex/AccountDetails?id='+this.recordId
        }

    }
    );

}
}