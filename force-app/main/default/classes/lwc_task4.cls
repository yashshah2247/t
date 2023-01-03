public with sharing class lwc_task4 {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
       return [SELECT Id, Name,email__c FROM Account];
    }
   @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){
        return [SELECT Id,FirstName,LastName,Email FROM Contact ];        
    }  
    @AuraEnabled(cacheable=true)
    public static List<Lead> getLead(){
        return [SELECT Id,Name,Email FROM Lead ];
    }
    // @AuraEnabled(cacheable=true)
    // public static void sendEmail(List<String> toAddress, String subject, String body) {      
    //     Messaging.reserveSingleEmailCapacity(1);
    //     try{
    //         System.debug(toAddress);
    //         System.debug(body);
    //         System.debug(subject);        
    //         // String[] toAdd = toAddress;
    //         // String[] toAddress = new String[]{'dabhidhrupal29012003@gmail.com','dabhidhrupal2003@gmail.com'};
    //         messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage();
    //         mail.setToAddresses(toAddress);
    //         mail.setReplyTo('dabhidhrupal2003@gmail.com');
    //         mail.setSenderDisplayName('Mvclouds');
    //         mail.setSubject(subject);
    //         mail.setHtmlBody(body);
    //         Messaging.sendEmail(new List<messaging.SingleEmailMessage> {mail});
    //     }
    //     catch (exception e){
    //         System.debug(e);
    //     }
    // }

}