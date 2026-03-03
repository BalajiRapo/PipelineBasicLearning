import { LightningElement,wire } from 'lwc';
import count from '@salesforce/apex/AccountController.getAccsCount';
import accrec from '@salesforce/apex/AccountController.getAccounts';
export default class Pagination extends LightningElement {
recordpage=10;
offsetrec =0;
recstodisplay;

countvalue;
pages=[];
totalCount=200;
currentpages=5;
accounts;
start = 1;
end = this.start +4;
//Code for displaying numbers
get visiblepages(){
    console.log('enters');
return this.currentPagesmetod( this.start, this.end+4);
}

handleNext(event){
 this.start = this.start+4;
 this.end = this.end +4;
 return this.currentPagesmetod( this.start+4, this.end+4);
}

handlePrevious(event){
this.start = this.start-4;
 this.end = this.end -4;
 return this.currentPagesmetod( this.start+4, this.end+4);
}
currentPagesmetod(start,end){
    return Array.from({length: end-start+1},
        (_,i) =>start+i
    );
  
}
//end code for displaying page numbers
//code for storing and displaying records
connectedCallback(){
 this.loadrec();
 this.handleRec(1);
}
loadrec(){
   accrec()
   .then(acc=>{
    this.accounts=acc;
   })
    
}

handleRec(event){
    console.log(event.target.dataset.page);
    console.log(this.recordpage);
    console.log(this.accounts);
   this.recstodisplay=this.accounts.slice((event.target.dataset.page-1)*this.recordpage,
   ((event.target.dataset.page)*this.recordpage));
   console.log(this.recstodisplay);
}
//end


}