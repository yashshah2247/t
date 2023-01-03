global class TestBathc implements Database.Batchable <SObject>{
        global Database.QueryLocator start (Database.BatchableContext bc){
            return Database.getQueryLocator('SELECT name from Account');
        }
        global void execute(Database.BatchableContext bc, List<Account> acList){
           for(Account ac :acList){
              ac.name = ac.name+' - batch update';   
           }
           update acList;
       }
        global void finish(Database.BatchableContext bc){
            System.debug('test succc...');
            AutoCreateOpp hp = new AutoCreateOpp();
            Database.executeBatch(hp);
        }
    }

/* TestBathc kj = new TestBathc();
Database.executeBatch(kj); */