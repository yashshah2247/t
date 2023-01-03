trigger task12 on Account (after insert) {
    if(trigger.isInsert && trigger.isAfter){
        task12.task12(trigger.new);
        // list<Contact> lstCon = new list<Contact>();
        // for(Account Acc: trigger.new){
        //     Contact con = new Contact ();
        //     // Con.FirstName = 'test';
        //     Con.AccountId = Acc.Id;
        //     Con.LastName = Acc.Name;
        //     Con.Phone = '7412589632';
        //     Con.Password__c = 'test123';
        //     lstCon.Add(Con);
            
        // }
        // insert lstCon;

    }
    

}