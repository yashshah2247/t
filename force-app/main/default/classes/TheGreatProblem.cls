public with sharing class TheGreatProblem {
    public static void TheGreatProblem(List<Contact> contactlist){
        Set<Id> accID = new Set<Id>();
        for(Contact c : contactlist){
            accID.add(c.AccountId);
        }
        Map<Id, Account> acc = new Map<Id, Account>([SELECT Id, Max_Amount__c FROM Account WHERE Id IN : accID]);
        List<Contact> c = new List<Contact>();
        for(Contact con : contactlist){
                while (con.Amount__c >acc.get(con.AccountId).Max_Amount__c) {
                    Contact cont = new Contact();
                    cont.LastName = con.LastName+'_'+con.Amount__c;
                    cont.Amount__c = acc.get(con.AccountId).Max_Amount__c;
                    cont.AccountId = con.AccountId;
                    cont.Phone = '7412589632';
                    cont.Password__c = 'test123';
                    c.add(cont);
                    con.Amount__c -= acc.get(con.AccountId).Max_Amount__c;   
            }
        }
        insert c;
    }
}



