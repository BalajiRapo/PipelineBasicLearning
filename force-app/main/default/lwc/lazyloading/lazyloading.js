import { LightningElement } from 'lwc';
import getaccs from '@salesforce/apex/GetAccRecords.getAcc';
  
//In JavaScript, you cannot declare const or let directly inside a class body.

export default class Lazyloading extends LightningElement {
    columns=[
        {label :'id', fieldName :'Id'},
        {label : 'name', fieldName :'Name'}
    ];
    offset=0;
    accsaray=[];
   display=false;
    connectedCallback(){
         this.loaddata();
    }

    loaddata(){
      getaccs({offset:this.offset})
      .then(accs =>{
        console.log('enters array');
        if(accs.length == 0){
           alert('limit reach');
        }
          this.accsaray=[...this.accsaray,...accs];
          console.log('array',this.accsaray);
          this.display=true;
      })
      .catch(error =>{
console.log(error);
      })
    }
    scrolling(){
        this.offset=this.offset+25;
        this.loaddata();
    }
}