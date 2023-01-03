public with sharing class contactSearchControllerl {
    public contactSearchControllerl() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Contact>displayConRecords(String searchkey){
        String searchword='%'+searchkey+'%';
        System.System.debug('==searchWord=='+searchWord);
        List<Contact> conlist=new List<Contact>();
        for(Contact con:[select LastName from Contact where LastName Like:searchWord]){
            conlist.add(con);
        }
        return conlist; 
        
    }
    
}
