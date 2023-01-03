import { LightningElement,track, wire} from 'lwc';
import displayConRecords from '@salesforce/apex/contactSearchControllerl.displayConRecords';


export default class DynamicContactSearch extends LightningElement {
    @track conLastName;
    @track records;
    @track error;
    @wire(displayConRecords,{searchkey:'$conLastName'})
    wiredContact({error,data}){
        if(data){
            this.records=data;
            this.error=error;

        }
        else{
            this.error=error;
            this.error=undefined;

        }

    }
    handleChnage(event){
        this.conLastName=event.target.value;
        console.log('ContactName'+this.conLastName);

    }
    
}