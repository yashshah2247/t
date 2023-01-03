global class MyClass {
    // webservice static void myMethod(String studentId){
    //     System.debug(studentId);

    // }
    public MyClass(ApexPages.StandardController controller) {
        
    }
        @future
        webservice static void myfuturemethod(Id studentId){
        
        Http http1=new Http();
        HttpRequest req1=new HttpRequest();
        req1.setendpoint('https://source.unsplash.com/random');
        //req1.Setheader('String','String');
        req1.setmethod('GET'); 
        HttpResponse res1;
        res1 = http1.send(req1);
        string responseValue = '';
        responseValue = res1.getBody();
        system.debug('Response Body for File: ' + responseValue);
        blob image = res1.getBodyAsBlob();
        String href_link = responseValue.substring(responseValue.indexof('https://'), responseValue.indexof('1080')+4);
        System.debug(href_link);
        HttpRequest http2 = new HttpRequest();
        http2.setEndpoint(href_link);
        http2.setMethod('GET');
        Http httpObject1 = new Http();
        HttpResponse img = httpObject1.send(http2);
                
        Attachment att = new Attachment(Name = 'Img', Body = img.getBodyAsBlob(), ContentType = 'image/jpeg',ParentId=studentId);
        insert att;
    }
    
}


// MyClass.myfuturemethod();


 