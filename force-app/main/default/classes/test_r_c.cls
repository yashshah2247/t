public class test_r_c{ 
public List<Account> recot {get; set;}
public List<Contact> recodes {get; set;}
// public string recot_1;
public List<User> recot_1 {get; set;}
public test_r_c(){
recot = [select Name, AccountNumber, ID from Account];
recot_1 = [Select id from user where firstname = 'Dharupal Dabhi'];
System.debug(recot_1);
recodes = [select Name, AccountId  from Contact];
}
}