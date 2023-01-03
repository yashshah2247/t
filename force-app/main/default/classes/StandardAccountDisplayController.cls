public with sharing class StandardAccountDisplayController{ 
public List<Account> records {get; set;}
public List<Contact> records1 {get; set;} 
public StandardAccountDisplayController(){ 
records = [select Name, AccountNumber, ID from Account]; 
records1 = [select AccountId from Contact];
} 
}