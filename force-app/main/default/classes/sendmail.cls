public class sendmail {
  
   @auraEnabled
   public static void sendMailWithPDF(String recordId, String subject, String body)
   {
      Contact cc = [Select Email FROM Contact WHERE Id =: recordId ];
       list<ContentVersion> conVer=[Select id,PathOnClient,FileType,Title,ContentSize,VersionData FROM ContentVersion where FirstPublishLocationId =: recordId];
       System.debug('conver::::'+conVer);
   
   String mimeBody = '';
   
   String nl = '\n';
   
   String boundary = '__ctrlq_dot_org__';   
   
   mimeBody += 'MIME-Version: 1.0\n';
   
   mimeBody += 'To: '+ cc.Email +'\n';
   
   mimeBody += 'cc: mailto:yashshah2247@gmail.com\n';
   
   mimeBody += 'bcc: mailto:yashshah2247@gmail.com\n';
   
   mimeBody += 'Subject: '+subject+' \n';
   
   mimeBody += 'Hello Testing\n';
   
   mimeBody += 'Content-Type: multipart/mixed; boundary='+boundary+'\n';
   
   mimeBody += '--'+boundary+'\n';
   
   mimeBody += 'Content-Type: text/plain; charset=UTF-8\n';
   
   mimeBody += 'Content-Transfer-Encoding: base64\n';
   
   mimeBody += EncodingUtil.base64Encode(blob.valueOf('Testinggg'))+'\n\n';
   
   mimeBody += '--'+boundary+'\n';
   
   mimeBody += 'Content-Type: text/html; charset=UTF-8\n';
   
   mimeBody += 'Content-Transfer-Encoding: base64\n\n';
   
   mimeBody += EncodingUtil.base64Encode(blob.valueOf(body))+'\n\n';
   
   mimeBody += '--'+boundary+'\n';
   
      for(ContentVersion cv:conVer){
   
   mimeBody += 'Content-Type:'+cv.Title+'/'+cv.FileType+''+';name=' + cv.Title + '\n';
   
   mimeBody += 'Content-Disposition: attachment; filename="' + cv.PathOnClient + '"\n';
   
   mimeBody += 'Content-Transfer-Encoding: base64\n\n';
   
   mimeBody += Encodingutil.base64Encode(cv.VersionData) + '\n\n';
   
   }
   
   mimeBody += '--'+boundary+'--';
   
   // System.debug('mm::'+ mimeBody);
   
   Http http = new Http();
   
   HttpRequest req = new HttpRequest();  
   
   req.setendpoint('callout:gmail_api/upload/gmail/v1/users/jenishgangani238@gmail.com/messages/send');
   
   //(Gmail_API)API Name of Name credential
   
      req.setHeader('Authorization', 'Bearer ');
   
      req.setHeader('Content-Type', 'message/rfc822');
   
      req.setBody('{"raw":"'+ mimeBody +'"}');
   
      req.setMethod('POST');
   
      req.setTimeout(60 * 1000);
   
      system.debug('req——>>'+req);
   
   HttpResponse response = http.send(req);
   
      system.debug('response——>>'+response.getBody());
   
      System.debug(response);
   
   if (response.getStatusCode() != 201) {
   
          System.debug('The status code returned was not expected: ' +
   
                       response.getStatusCode() + ' ' + response.getStatus());  
   
   } else {
   
          System.debug(response.getBody());
   
   } 
   
      }
   }