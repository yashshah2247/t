({
    doInit : function(component, event, helper) {
        // console.log(component.get("v.pageReference").state.testAttribute);
        // document.getElementById("demo").innerHTML =  window.location.href;
        var currentLocation = window.location;
        // alert("url"+currentLocation);
        var splitUrl = currentLocation.split('/');
        console.log('yash' + splitUrl);
        // alert("splitUrl"+splitUrl);
        

 
    },
    searchKeyChange : function(component, event, helper) {
        var subject = component.find("subject").get("v.value");
        var body = component.find("body").get("v.value");
        // alert("Hello! I am an alert box!!" + subject);

    },
    handleUploadFinished: function (cmp, event) {
        // Get the list of uploaded files
        var uploadedFiles = event.getParam("files");
        alert("Files uploaded : " + uploadedFiles.length);
        alert("recordId : " + uploadedFiles.recordId);

        // Get the file name
        uploadedFiles.forEach(file => console.log(file.name));
    }
})
