public with sharing class task10 {
    // public static void task10(List<Account> acc) {
    //     for (Account a : acc){
    //     	Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();          
    //     	req.setComments('Submitting Account Record approval request using Trigger');        
    //     	req.setObjectId(a.id);        
    //     	Approval.ProcessResult result = Approval.process(req);
    // 	}

    // }
    public static void ApprovalRequest(List<Account> acc){
        for (Account a : acc){
        	Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();          
        	req.setComments('Submitting Account Record approval request using Trigger');        
        	req.setObjectId(a.id);        
        	Approval.ProcessResult result = Approval.process(req);
    	}
    }
}
