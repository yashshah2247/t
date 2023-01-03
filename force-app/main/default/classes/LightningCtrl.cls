public class LightningCtrl { 
    // @AuraEnabled 
    // global List<Contact> lstContact;
    // Integer offSetSize = 0;
	// Integer QueryLimit = 10;

        // public static List<Account> getContacts_1(){ 
        //     return [SELECT Account.Name,(SELECT name,Contact.FirstName, Contact.LastName, Email, Phone FROM Account.Contacts) FROM Account LIMIT 20]; 
        // }
        @AuraEnabled
        public static List<Account> findByName(String searchKey){ 
            Integer offSetSize = 0;
	        Integer QueryLimit = 10;
            String name ='%' + searchKey + '%';
            System.debug(name);
            return [Select Name From Account Where name Like:name ORDER BY Name LIMIT :QueryLimit OFFSET :offSetSize]; 
        }
        @AuraEnabled
        public static List<Contact> getContacts(){
            List<Contact> lstContact;
            Integer offSetSize = 0;
	        Integer QueryLimit = 10;
            lstContact = [SELECT Id, Name, Phone,Email,Birthdate FROM Contact ORDER BY Name LIMIT :QueryLimit OFFSET :offSetSize  ];
            return lstContact;  
        } 
    }
