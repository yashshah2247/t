trigger trigEventsTest on Department__c (before insert,after insert,before update,after update) {
	if(Trigger.isInsert) {
		system.debug('***IsINSERT*****');
	}

	if(Trigger.isUpdate) {
		system.debug('******IsUpdate*****');
	}

	if(Trigger.isBefore && Trigger.isInsert) {
		system.debug('****IsBefore and IsInsert*****');
	}

	if(Trigger.isAfter && Trigger.isInsert) {
		system.debug('*******IsAfter and IsInsert*****');
	}

	if(Trigger.isBefore && Trigger.isUpdate) {
		system.debug('*****Before Update******');
	}
    if (Trigger.isBefore) {
        System.debug('********Trigger values***********');
        System.debug('***SFDC: Trigger.old is: ' + Trigger.old);
        System.debug('***SFDC: Trigger.new is: ' + Trigger.new);
    }
    
    if (Trigger.isAfter) {
        System.debug('********Trigger values***********');    
        System.debug('***SFDC: Trigger.old is: ' + Trigger.old);
        System.debug('***SFDC: Trigger.new is: ' + Trigger.new);
       
    }
    if (Trigger.isBefore) {
        for(Department__c dep:Trigger.New){
            if(dep.hod_name__c	 != Trigger.oldMap.get(dep.Id).hod_name__c	){
                // Your logic
                System.debug('true')
            }
        }
    }
    if (Trigger.isBefore) {
        System.debug('Size: ' + Trigger.New.size());
        List<Department__c> accList = new List<Department__c>();
        for(Department__c undeletedAccount : trigger.new){ 
            undeletedAccount.hod_name__c = ('Undeleted :' + undeletedAccount.hod_name__c);
            accList.add(undeletedAccount);
        } 
        update accList;
    }
}