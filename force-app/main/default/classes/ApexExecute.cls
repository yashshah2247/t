public with sharing class ApexExecute {
    public ApexExecute() {
        List<Account> tasks = new List<Account>();
        for(Integer i=0; i<2000;i++){
            System.debug(i);
            Account acc = new Account();
            acc.Name = 'Test_'+i;
            tasks.add(acc);      
        }
        insert tasks;
    }
}

/*ApexExecute s1=new ApexExecute();
s1.ApexExecute();*/
