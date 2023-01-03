public class AccountsController {
    @AuraEnabled
    public static List <Account> getAccounts() {
        return [SELECT Id, name, Type, Phone FROM Account ORDER BY createdDate ASC limit 10];
    }    
    @AuraEnabled
    public static List<Account> findByName(String searchKey) {
        String name =  + searchKey + '%';
        return [SELECT id, name, phone,type FROM Account WHERE name LIKE :name limit 10];
    }
    @AuraEnabled
    public static List<Contact> conList(String AccName){
        return [SELECT FirstName,LastName,Email fROM Contact WhERE Account.Name =:AccName]; 
    }
}