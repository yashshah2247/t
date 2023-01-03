public with sharing class TheTestAcc {
    list<AccountWrapper> wraplist=new list<AccountWrapper>();
    public TheTestAcc()
    {
       Map<Id, AccountWrapper> accMap=new Map<Id, AccountWrapper>();
       for(account a:[SELECT createdby.name,CreatedbyID,Account.Name,(SELECT      
                name,Contact.FirstName, Contact.LastName, Email, Phone 
                FROM Account.Contacts) FROM Account])
       {
     AccountWrapper accWrap=accMap.get(a.CreatedByid);  
           if (null==accWrap)
           {
              accWrap=new AccountWrapper();
              accMap.put(a.CreatedByid, accWrap);
           }
           accWrap.accounts.add(a);
       }
       wrapList=accMap.values();
   }
   public list<AccountWrapper> getaccounts()
   {
      return wraplist;
   }
   public class AccountWrapper
   {
      public List<Account> accounts {get; set;}
      public AccountWrapper()
      {
         accounts=new List<Account>();
      }
   }
}
