trigger task11 on Account (after update , before update ) {
    
    // if(trigger.isUpdate && trigger.isAfter){
     List<Account> acc = new List<Account>();



    //     task11.task11(trigger.new);
            Account be = Trigger.old[0];
            Account after = Trigger.new[0];
            // User VarU = [Select id from user where Name = 'Charlie soni'];
            User VarU = [Select id from user where Name = 'Sahil soni'];
            System.debug(VarU);
            if(be.Rating != 'Hot'){
                System.debug('hello');
                if(after.Rating.equals('Hot')){
                    System.debug('0');
                    AccountShare a = new AccountShare();
                    a.UserOrGroupID = varu.Id;
                    a.AccountId = be.Id;
                    a.AccountAccessLevel = 'Edit';
                    a.OpportunityAccessLevel = 'Edit';
                    // a.ContactAccessLevel = 'Edit';
                     a.CaseAccessLevel = 'Edit';   
                    // a.ContactAccessLevel = 'ControlledByParent';
                    
                    insert a;
                }
            }
    
}