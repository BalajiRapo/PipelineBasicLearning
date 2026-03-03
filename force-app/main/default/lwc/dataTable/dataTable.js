import { LightningElement,wire } from 'lwc';
import getaccs from '@salesforce/apex/DataTable.getAccounts';
import updateaccs from '@salesforce/apex/DataTable.updateAcc';
import {deleteRecord} from 'lightning/uiRecordApi';
export default class DataTable extends LightningElement {
draftValues=[];
data =[];
actions =[
    {label:'edit',name:'edit'},
    {label:'delete',name:'delete'}
]
columns =[
    {label:'Id',fieldName:'Id',editable:false},
    {label:'Name',fieldName:'Name',editable:true},
    {
        type : 'action',
        typeAttributes:{
            rowActions:this.actions
        }
    }
]
@wire(getaccs)
getAccsData({data,error}){
    if(data){
        console.log('enters data');
        this.data=data;
        console.log(this.data);
    }
    else{
console.log(this.error);
    }
}
saverec(event){
        console.log('enters try');
    this.draftValues=event.detail.draftValues;
    console.log('enters before update',this.draftValues);
   updateaccs({accs:this.draftValues});
}
handleRowAction(event) {
    const actionName = event.detail.action.name;
    const recordId = event.detail.row.Id;
    console.log('rec id ' + recordId);

    if (actionName === 'delete') {
        deleteRecord(recordId)
            .then(() => {
                console.log('deleted');
                this.data = this.data.filter(record => record.Id !== recordId); // remove from UI
            })
            .catch(error => {
                console.error(error.body ? error.body.message : error);
            });
    }
    console.log('after delete');
}



}