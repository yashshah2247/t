public class myFutureButtonController{
    private String opportunityId ;
    public myFutureButtonController(){
    //get the opportunityId
        this.opportunityId = ApexPages.CurrentPage().getparameters().get('thisOppId'); //custom parameter name, make sure this is used in the custom button
        if(opportunityId != null){//don't queue the job unless we have the id to pass in
        
            sendCallOut(opportunityId); //call the future method and let it know the id of the opty you want it to work with
        }
    }
    @future(callout=true)
    public sendCallOut(String oppId) {
    //some action using the current opportunity
        Opportunity theOppRecord ;
        List<Opportunity> lo = new List<Opportunity>([select id from Opportunity where Id = :opportunityId]); //query as a list even if you only want one record to avoid no object found to assign to sobject variable error
        if(lo.size() > 0){ //only do the call out if you have the data needed
            theOppRecord = lo[0];
            //now use the query result theOppRecord to complete any pre call out logic                               
            HttpRequest req = new HttpRequest();                       
            //add the appropriate headers                       
            //put opportunity data in the body of request                     
            HTTPResponse resp = new HTTPResponse();              
            //send and process request
        }
        else  { //handle the error, send the user an email/post to chatter
        }   
    
     
        }//end sendCallOut()
     
    }