public with sharing class task11 {
    public static void task11(List<Account> acc) {
        List<AccountShare> listaccs = new List<AccountShare>();
        for (Account a : acc){
            AccountShare accs = new AccountShare();
        User VarU = [Select id from user where Name = 'Sahil soni'];
        accs.AccountId = a.Id;
        // accs.RowCause = '';
        accs.UserOrGroupId = VarU.id;
        accs.AccountAccessLevel = 'Edit';
        accs.OpportunityAccessLevel = 'Edit';
        accs.ContactAccessLevel = 'Edit';
        accs.CaseAccessLevel = 'Read';
        listaccs.add(accs);
    }
    // insert listaccs;
    Database.SaveResult[] result =  Database.insert(listaccs,false);
    System.debug(result);
    }
}