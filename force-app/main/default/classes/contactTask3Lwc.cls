public with sharing class contactTask3Lwc {
    public contactTask3Lwc() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(Id accId){
        return[SELECT Id,LastName,FirstName,Phone FROM Contact WHERE AccountId =: accId];
    }
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunity(Id accId){
        return[select Id,Name,StageName from Opportunity where AccountId =: accId];}
}