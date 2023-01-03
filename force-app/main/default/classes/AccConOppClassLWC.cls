public with sharing class AccConOppClassLWC {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        return[select Id,Name,Phone from Account limit 15];
    }

}
