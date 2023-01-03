public class accountcontact1
{
   // public List<User> recot_1 {get; set;}
    list<AccountWrapper> wraplist=new list<AccountWrapper>();
    public accountcontact1()
    {
      // recot_1 = [Select id from User where Name = 'Sahil soni'];
      // System.debug(recot_1 + 'Sahil soni');
       Map<Id, AccountWrapper> accMap=new Map<Id, AccountWrapper>();
       for(account a:[SELECT createdby.name,CreatedbyID,Account.Name,(SELECT      
                name,Contact.FirstName, Contact.LastName, Email, Phone 
                FROM Account.Contacts) FROM Account LIMIT 20])
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