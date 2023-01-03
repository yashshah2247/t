public with sharing class GetRecordTAsk4 {
    public GetRecordTAsk4() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Lead> getLead(){
        return[SELECT Id,Name,Email,Phone FROM Lead];
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(){
        return[SELECT Id,Name,email__c,Phone FROM Account];
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){
        return[SELECT Id,Name,Phone,Email FROM Contact];
    }
}
