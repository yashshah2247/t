// apex class of Sheep_Problem trigger
public with sharing class Sheep_Problem {
    public static void Sheep_Problem(list<contact> old,list<contact> new_1,Map<Id,Contact> lstOfconts,Map<Id,Contact> af) {
        List<Contact> liscon = new List<Contact>();

        // List<Contact> contactList = new List<Contact>();

        for(Contact acc: af.values()){
            liscon = new List<Contact>();
            if([SELECT Count() FROM Contact WHERE AccountId =: lstOfconts.get(acc.Id).AccountId] != 0){
                liscon = [Select AccountId FROM Contact WHERE AccountId =: lstOfconts.get(acc.Id).AccountId];
                // for (Contact con: liscon) {
                //     con.AccountId = acc.AccountId;
                // }
                for(Integer i = 0;i<liscon.size();i++){
                    liscon[i].AccountId = acc.AccountId;
                }
                // contactList.addAll(liscon);
                update liscon;
            }
        }
        // update contactList;




            // set<id> newaccIds = new set<id>();
            // for(contact con : af){
            //     if(con.accountid != null){
            //         newaccIds.add(con.accountid);
            //     }
            // }
            // System.debug('New id acc list :- '+ newaccIds);
            // set<id> accIds = new set<id>();
            // for(contact con : lstOfconts){
            //     if(con.accountid != null){
            //         accIds.add(con.accountid);
            //     }
            // }
            // System.debug('Old id acc list :- '+ accIds);
            // list<Contact> lstAccs = [Select Id,Name,accountid,Amount__c From Contact where AccountId IN: accIds ORDER BY Account.Name];
            // for(Contact ac: lstAccs){
            //     System.debug(ac);
            // }
            // for(id i: accIds){
            //     for(Contact c: oldMap.values()){
            //         if(c.AccountId == i){
            //             System.debug('->'+c.AccountId+' c.Name '+c.Name);
            //         }
            //     }
            // }

            // for(integer a = 0; a < accIds.size(); a++ ){
                
            //     System.debug(a);
            // }


            // list<Contact> lstAccs = [Select Id,Name,Amount__c From Contact where AccountId IN: accIds];
            // for (contact a : af){
            //     if(!lstAccs.isEmpty()){
            //         for(contact acc :lstAccs){
            //             acc.accountid=a.accountid;
            //         }
            //     }
            // }
            // if(!lstAccs.isEmpty()){
            //     update lstAccs;
            // }
       
    }
}


