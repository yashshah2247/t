public with sharing class test_email {
    public test_email() {
        
        
    }
    @AuraEnabled
    public static void updateCase(String recordId, String subject1, String body){
        System.debug('testtttttttttt');
        system.debug('hiii'+recordId);
        String recordId_1 = recordId;
        String subject_1 = subject1;
        String body_1 = body;
        Contact cc = [Select Email FROM Contact WHERE Id =: recordId ];
        system.debug('yash'+cc.Email);
        // HttpRequest req = new HttpRequest();
        // String toAddress = cc.Email;
        // String subject = subject_1;
        // String mailBody = body_1;
        // String mbody = '{ "raw" : "' + EncodingUtil.base64Encode(Blob.valueof( 'To: ' + toAddress + '\r\nContent-Type:text/plain; charset=utf-8;\r\nSubject: ' + subject + '\r\n\r\n' + mailBody )) + '"}';
        // req.setHeader('Content-Length', mbody.length()+'');
        // req.setHeader('Content-Type', 'application/json');
        // req.setEndpoint('callout:Gmail_API/gmail/v1/users/yashshah2247@gmail.com/messages/send');
        // //req.setEndpoint('https://gmail.googleapis.com');
        // req.setMethod('POST');
        // system.debug(mbody);
        // req.setBody(mbody);
        // // Send the request, and return a response
        // Http h = new Http();
        // HttpResponse res = h.send(req);
        // system.debug(res);

    }
}
