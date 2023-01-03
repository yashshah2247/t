import { LightningElement,track} from 'lwc';

export default class New_LWC_task5 extends LightningElement {
    @track allValues = [];
    changeHandler(event) {
        if(allValues.length > 1){
            console.log('hiiiiii');
        }
        // if (!this.allValues.includes(event.target.value)) { this.allValues.push(event.target.value); }
        // // console.log(JSON.stringify(this.allValues));
        // this.serchrecode();
    }

}