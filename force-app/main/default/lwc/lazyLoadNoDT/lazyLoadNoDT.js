import { LightningElement } from 'lwc';
import getAcc from '@salesforce/apex/GetAccRecords.getAcc';
export default class LazyLoadNoDT extends LightningElement {
    arraydata=[];
    offset=0;
    connectedCallback(){
        this.loaddata();
    }
    loaddata(){
    getAcc({offset :this.offset})
    .then(acc => {
      this.arraydata =[...this.arraydata,...acc];
      console.log(this.arraydata);
    })
    .catch(error =>{
      console.log(error);
    })
    }
     handleScroll(event) {
       console.log('scroll working');
       this.offset = this.offset + 50;
       this.loaddata();
    }

}