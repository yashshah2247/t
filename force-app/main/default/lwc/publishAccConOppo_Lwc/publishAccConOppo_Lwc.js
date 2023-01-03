import { LightningElement,track,wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccConOppClassLWC.getAccounts';
import { createMessageContext, releaseMessageContext, publish, MessageContext } from 'lightning/messageService';
import SAMPLEMC from '@salesforce/messageChannel/SampleMessageChannel__c';
export default class PublishAccConOppo_Lwc extends LightningElement {
    accountList = [];

    @wire(MessageContext)
    messageContext;

    connectedCallback(){
        console.log('Entry:');
        getAccounts()
            .then(result => {
                this.accountList = result;
                console.log('accountList:'+ JSON.stringify(this.accountList));    
            })
            .catch(error => {
                this.accountList = error;
            });   
    }

    handleChange(event){
        console.log('trigger handle event');
        const message = {
            recordId : event.target.value,
        };
        console.log('published message : '+JSON.stringify(message));
        publish(this.messageContext, SAMPLEMC, message);
    }

}