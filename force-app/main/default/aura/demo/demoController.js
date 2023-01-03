({
    doInit : function(component, event, helper) {
        // console.log(component.get("v.pageReference").state.testAttribute);
        // document.getElementById("demo").innerHTML =  window.location.href;
        var currentLocation = window.location;
        // alert("url"+currentLocation);
        // var splitUrl = currentLocation.split('/');
        // console.log('yash' + splitUrl);
        // alert("splitUrl"+splitUrl);
        // var rId = component.get('v.recordId');
        // var rId = component.get('v.recordId');
        // alert('hiii' + rId);
    },
    // searchKeyChange : function(component, event, helper) {
    //     var subject = component.find("subject").get("v.value");
    //     var body = component.find("body").get("v.value");
    //     // alert("Hello! I am an alert box!!" + subject);

    // },
    searchKeyChange: function(component, event) {
        var subject = component.find("subject").get("v.value");
        console.log("subject " + subject);
        var body = component.find("body").get("v.value");
        console.log("body " + body);
        var rId = component.get('v.recordId');
        console.log("rId " + rId);
        
        var uploadedFiles = event.getParam("files");
        uploadedFiles.forEach(file => console.log(file.name)); 
        alert("Files uploaded : " + uploadedFiles.length);
        

        // var action = component.get("c.getCountries");
        var action = component.get("c.updateCase");
        // alert('hello');
        action.setParams({
            "recordId": rId,
            "subject1": subject,
            "body": body,
        });
        $A.enqueueAction(action);
    },
    handleUploadFinished: function (cmp, event) {
        // Get the list of uploaded files
        var uploadedFiles = event.getParam("files");
        alert("Files uploaded : " + uploadedFiles.length);
        // alert("recordId : " + uploadedFiles.recordId);

        // Get the file name
        uploadedFiles.forEach(file => console.log(file.name));
    }
})

// ContentVersion cv = new ContentVersion();
// cv.Title = 'Test Document';
// cv.PathOnClient = 'TestDocument.pdf';
// cv.VersionData = Blob.valueOf('Test Content');
// cv.IsMajorVersion = true;
// Insert cv;
 
// //Get Content Documents
// Id conDocId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:cv.Id].ContentDocumentId;
