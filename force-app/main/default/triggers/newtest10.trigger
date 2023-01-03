trigger newtest10 on Account (after insert) {
    // Account a = Trigger.new[0];
    // Account ainserted = [SELECT Id FROM Account WHERE Id =: a.Id];
    // Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
    // req.setProcessDefinitionNameOrId('test_acc');
    // req.setComments('Submitted for approval. Please approve.');
    // req.setObjectId(UserInfo.getUserId());
    // Approval.ProcessResult result = Approval.process(req);
    for (Account a : trigger.new){
        Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();          
        req.setComments('Submitting Account Record approval request using Trigger');        
        req.setObjectId(a.id);        
        Approval.ProcessResult result = Approval.process(req);
    }

}