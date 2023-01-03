public class SampleRollupSummary {
  
    public static void rollupContacts(list<contact> lstOfconts){
        system.debug('==lstOfconts== : '+lstOfconts);
        set<id> accIds = new set<id>();
        list<account> Acc_list = new list<account>();
        list<contact> lstCons = new list<contact>();
      
        for(contact con : lstOfconts){
            if(con.accountid != null){
                accIds.add(con.accountid);
            }
        }
        system.debug('==accIds==:'+accIds);
        list<account> lstAccs = [select id,name,Amount__c, (select id,Amount__c from contacts) from account where id in : accIds];
        
        for(account acc : lstAccs){
            system.debug('==acc.contacts.size()=='+acc.contacts.size());
            Decimal sumamt = 0;
            if(acc.contacts.size() >0){
                for(contact co : acc.contacts){
                    if(co.Amount__c != null){
                        sumamt = sumamt+co.Amount__c; 
                    }     
                }
                acc.Amount__c = sumamt;
                Acc_list.add(acc);
            }
        }
        if(Acc_list.size() > 0){
            update Acc_list;
        }
      
      
    }
  
}