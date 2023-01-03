public class testtesttask4 {
    public List<Contact> contacts {get;set;}
    public String data {get;set;}
    public Integer currentpage {get;set;}
    public Integer Lastpage {get;set;}
    public Integer total {get;set;}
    public Integer lastvalue{get;set;}
    public Integer firstvalue{get;set;}
    public Integer size = 0;
    public Integer li = 10;

    public testtesttask4() {
        data = 'select firstname, lastname, email, phone from contact where firstname != null Limit : li OFFSET : size' ;
        contacts = Database.query(data);
        total = [SELECT COUNT() FROM Contact];
        firstvalue = 1;
        lastvalue = size+10;
        currentpage = 1;
        Lastpage = ((Integer) Math.ceil(78/10))+1;
    }
    public PageReference runSearch() {
        String firstName = Apexpages.currentPage().getParameters().get('firstname');    
        data = 'select firstname, lastname, email, phone from contact where firstname != null ';
        if (!firstName.equals(''))
          data += ' and firstname LIKE \''+String.escapeSingleQuotes(firstName)+'%\'' + 'Limit : li OFFSET : size';
        else
          data += 'Limit :li';
          contacts = Database.query(data);
          return null;
    }
    public boolean getprv(){
        if(size > 0)
            return false;
        else
            return true;
    }
    
    public boolean getnxt(){
        if(size + li < total)
            return false;
        else
            return true;
    }
    
    public PageReference next(){
        size += li;
        firstvalue = size+1;
        lastvalue = size+10;
        currentpage = (size/10)+1;
        if(total < lastvalue)
            lastvalue = total;
        contacts = [SELECT FirstName, LastName, Email, Phone FROM Contact  LIMIT:li OFFSET:size];
        return null;
    }
    
    public PageReference prv(){
        size -= li;
        firstvalue = size+1;
        lastvalue = size+10;
        if(size>=0){
            contacts = [SELECT FirstName,LastName, Email, Phone FROM Contact  LIMIT:li OFFSET:size];
        }
        return null;
    }

}