public with sharing class releted_recods {
    public releted_recods() {
        public List<Account> records {get; set;}

    }
    public StandardAccountDisplayController(){ 
        records = [select Name, AccountNumber, ID, Contact from Account];
    }
}
