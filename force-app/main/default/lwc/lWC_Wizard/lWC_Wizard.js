import { LightningElement, track, api } from 'lwc';
import getAccount from '@salesforce/apex/GetRecordTAsk4.getAccount';
import getLead from '@salesforce/apex/GetRecordTAsk4.getLead';
import getContacts from '@salesforce/apex/GetRecordTAsk4.getContacts';
import sendEmailController from "@salesforce/apex/EmailClass.sendEmailController";


export default class LWC_Wizard extends LightningElement {

    accountList = [];
    leadList = [];
    contactList = [];
    toAddress = [];
    connectedCallback(){
        console.log('Entry:');
        getAccount()
            .then(result => {
                this.accountList = result;
                // onchange={handleFinish}    
            })
            .catch(error => {
                this.accountList = error;
            });
        getLead()
            .then(result => {
                this.leadList = result;
                // console.log('leadList:'+ JSON.stringify(this.leadList));    
            })
            .catch(error => {
                this.leadList = error;
            });
        getContacts()
            .then(result => {
                this.contactList = result;
                // console.log('contactList:'+ JSON.stringify(this.contactList));    
            })
            .catch(error => {
                this.contactList = error;
            });   
    }
    @track currentStep = '1';
    @track currentStep_1 = '0';
    @track currentobj = 'null';
 
    handleOnStepClick(event) {
        this.currentStep = event.target.value;
    }

    get isAcc() {
        return this.currentobj === "Account";
    }

    get isCon() {
        return this.currentobj === "Contact";
    }

    get isLead() {
        return this.currentobj === "Lead";
    }
 
    get isStepOne() {
        return this.currentStep === "1";
    }
 
    get isStepTwo() {
        return this.currentStep === "2";
    }
 
    get isStepThree() {
        return this.currentStep === "3";
    }
 
    get isEnableNext() {
        return this.currentStep != "3";
    }
 
    get isEnablePrev() {
        return this.currentStep != "1";
    }
 
    get isEnableFinish() {
        return this.currentStep === "3";
    }
    get disablePrevious(){ 
        return this.currentStep_1>=1
    }
 
    handleNext(){
        console.log('you are in handleNextr ');
        if(this.currentStep == "1"){
            this.currentStep = "2";
        }
        else if(this.currentStep = "2"){
            console.log(this.emailsubject);
            console.log(this.emailbody);
            this.currentStep = "3";
        }
    }
 
    handlePrev(){
        if(this.currentStep == "3"){
            this.currentStep = "2";
        }
        else if(this.currentStep = "2"){
            this.currentStep = "1";
        }
    }
    @track temp_email = '';
    handleFinish(event){
        this.temp_email =event.target.value;
        // alert('you ' + this.temp_email);
        this.toAddress.push(this.temp_email);
        console.log('email list:'+ JSON.stringify(this.toAddress));
    }
    getsubject(event){
        this.emailsubject = event.target.value;
    }
    getbody(event){
        this.emailbody = event.target.value;
    }
    @track selectedOption;
    changeHandler(event) {
    const field = event.target.name;
    if (field === 'optionSelect') {
        this.selectedOption = event.target.value;
        this.currentobj = event.target.value;
            // alert("you have selected : " + this.selectedOption);
            // alert("you currentobj : " + this.currentobj);
        } 
    }
    toAddress = [];
    ccAddress = [];
    subject = "";
    body = "";
    @track files = [];

    wantToUploadFile = false;
    noEmailError = false;
    invalidEmails = false;

    toggleFileUpload() {
        this.wantToUploadFile = !this.wantToUploadFile;
    }

    handleUploadFinished(event) {
        const uploadedFiles = event.detail.files;
        this.files = [...this.files, ...uploadedFiles];
        this.wantToUploadFile = false;
    }

    handleRemove(event) {
        const index = event.target.dataset.index;
        this.files.splice(index, 1);
    }

    handleToAddressChange(event) {
        this.toAddress = event.detail.selectedValues;
    }

    handleCcAddressChange(event) {
        this.ccAddress = event.detail.selectedValues;
    }

    handleSubjectChange(event) {
        this.subject = event.target.value;
        console.log("res subject"+ this.subject);
    }

    handleBodyChange(event) {
        this.body = event.target.value;
        console.log("res body" + this.body);
        
    }

    validateEmails(emailAddressList) {
        let areEmailsValid;
        if(emailAddressList.length > 1) {
            areEmailsValid = emailAddressList.reduce((accumulator, next) => {
                const isValid = this.validateEmail(next);
                return accumulator && isValid;
            });
        }
        else if(emailAddressList.length > 0) {
            areEmailsValid = this.validateEmail(emailAddressList[0]);
        }
        return areEmailsValid;
    }

    validateEmail(email) {
        console.log("In VE");
        const res = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()s[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        console.log("res", res);
        return res.test(String(email).toLowerCase());
    }

    handleReset() {
        this.toAddress = [];
        this.ccAddress = [];
        this.subject = "";
        this.body = "";
        this.files = [];
        this.template.querySelectorAll("c-email-input").forEach((input) => input.reset());
    }

    handleSendEmail() {
        this.noEmailError = false;
        this.invalidEmails = false;
        if (![...this.toAddress, ...this.ccAddress].length > 0) {
            this.noEmailError = true;
            return;
        }
        
        if (!this.validateEmails([...this.toAddress, ...this.ccAddress])) {
            this.invalidEmails = true;
            return;
        }

        let emailDetails = {
            toAddress: this.toAddress,
            ccAddress: this.ccAddress,
            subject: this.subject,
            body: this.body
        };

        sendEmailController({ emailDetailStr: JSON.stringify(emailDetails) },this.toAddress)
            .then(() => {
                console.log("Email Sent");
            })
            .catch((error) => {
                console.error("Error in sendEmailController:", error);
            });
            this.currentStep_1 = "2";
    }
}