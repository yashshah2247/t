public with sharing class task12 {
    
    public static void task12(List<Account> ac) {
        list<Contact> lstCon = new list<Contact>();
        for(Account Acc: ac){
            Contact con = new Contact ();
            // Con.FirstName = 'test';
            Con.AccountId = Acc.Id;
            Con.LastName = Acc.Name;
            Con.Phone = '7412589632';
            Con.Password__c = 'test123';
            lstCon.Add(Con);
            
        }
        insert lstCon;

    }
}
