trigger task10 on Account (after insert) {
    if(trigger.isInsert && trigger.isAfter){
        task10.ApprovalRequest(trigger.new);
    }
    
    // for (Account offer :  Trigger.new) {

    //     if (Trigger.isAfter && Trigger.isInsert) {
    //         Approval.ProcessSubmitRequest approvalRequest = new Approval.ProcessSubmitRequest();
    //         approvalRequest.setComments('Offer Submitted for approval');
    //         approvalRequest.setObjectId(offer.Id);
    //         Approval.ProcessResult result = Approval.process(approvalRequest);
    //         System.debug('offer submitted for approval successfully: '+result .isSuccess());

    //     }

    // }




    // List<Account> acc = new List<Account>();
    // for (Account a : acc){
    //     Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();          
    //     req.setComments('Submitting Account Record approval request using Trigger');        
    //     req.setObjectId(a.id);        
    //     Approval.ProcessResult result = Approval.process(req);
    // }
   
}