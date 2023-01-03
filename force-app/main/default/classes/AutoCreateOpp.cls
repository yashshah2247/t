global class AutoCreateOpp implements Database.Batchable <SObject> {
    global Database.QueryLocator start (Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT name,id from Account');
    }
    global void execute(Database.BatchableContext bc, List<Account> acList){
        list<Opportunity> lstopp = new list<Opportunity>();
        for(Account ac :acList){
           Opportunity opp = new Opportunity ();
           opp.AccountId = ac.Id;
           opp.Name = 'Opp - '+ac.Name;
           opp.StageName = 'Prospecting';
           opp.CloseDate = Date.Today()+15;
           lstopp.Add(opp);       
        }
        insert lstopp;
    }
    global void finish(Database.BatchableContext bc){
        System.debug('test succc...');
    }
}

/* AutoCreateOpp kj = new AutoCreateOpp();
Database.executeBatch(kj); */

