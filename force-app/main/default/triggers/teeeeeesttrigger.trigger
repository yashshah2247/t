trigger teeeeeesttrigger on Contact (after update) {
    List<Contact> conrecord = new List<Contact>();
    Contact con0 = new Contact();
    Account acc = new Account();
    Account acc0 = new Account();
    for (Contact con : Trigger.old){
        con0 = [select id, AccountId, Name from Contact where Id=:Trigger.new[0].Id];
        System.debug('new details:-'+con0);
        acc = [select id, Name from Account where id = :con0.AccountId];
        System.debug('new account details:-'+acc);
        conrecord = [select id, AccountId, Name from Contact where id != :con0.Id and AccountId = :con.AccountId];
        System.debug('contacts with old account:-'+conrecord);
        if (conrecord.size()>0){    
            for (Contact con2 : conrecord){
                con2.AccountId = acc.Id;
                System.debug('Updated contact'+con2.AccountId+' name:-'+con2.Name);
                update con2;
            }
        }
    }

}