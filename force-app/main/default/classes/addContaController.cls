public with sharing class addContaController {
    public contact con {get;set;} 

    public addContaController(){
        con = new Contact();
    }
    public void saveContact(){
        insert con;
        con = new Contact();
    }
}