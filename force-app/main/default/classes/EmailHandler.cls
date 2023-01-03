public with sharing class EmailHandler {
    @AuraEnabled
    public static void sendEmail(List<String> toAddress, String subject, String body) {      
        Messaging.reserveSingleEmailCapacity(1);
        try{
        messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage();
        
        System.debug(toAddress);
        System.debug(body);
        System.debug(subject);
        // toAddress.add('er.rajat15@gmail.com');
        
        String[] toAddre = toAddress;
        mail.setToAddresses(toAddre);
        mail.setReplyTo('dabhidhrpal2003@gmail.com');
        mail.setSenderDisplayName('Mvclouds');
        mail.setSubject(subject);
        mail.setHtmlBody(body);
        // mail.setEntityAttachments(files);
        Messaging.sendEmail(new List<messaging.SingleEmailMessage> {mail});
        }
        catch (exception e){
            throw new AuraHandledException(e.getMessage());
            //return null;
        }
    }
}