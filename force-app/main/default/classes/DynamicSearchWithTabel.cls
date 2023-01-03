public with sharing class DynamicSearchWithTabel {
    public List<Contact> contacts {get;set;}
    private String soql {get;set;}
    // private String soql_2 {get;set;}
    public Integer countTotalRecords{get;set;}
    public Integer png{get;set;}
    public Integer png_1{get;set;}
    public Integer offSetSize = 0;
	public Integer QueryLimit = 10;
    public Integer test = QueryLimit - 1;
    public Integer c_pn{get;set;}
    public Integer t_pn{get;set;}
    public Integer i{get;set;}
    public Decimal d{get;set;}
    public Decimal a{get;set;}
    public Decimal b{get;set;}
    
    public DynamicSearchWithTabel() {
        soql = 'select firstname, lastname, Email, Phone from contact ORDER BY Name LIMIT :QueryLimit OFFSET :offSetSize';
        contacts = Database.query(soql);
        // soql_2 = 'select firstname, lastname, Email, Phone count() from contact';
        // countTotalRecords = Database.query(soql_2);
        countTotalRecords = 90;
        // System.debug('The record which has satisfied the condition');
        png = 1;
        png_1 = QueryLimit;
        a= QueryLimit;
        b=countTotalRecords;
        // c_pn = Math.ceil(countTotalRecords/QueryLimit);
         c_pn = 1;
    //    t_pn = 86/QueryLimit;
//         t_pn = (Integer) Math.ceil(70/10 + 1);
        // t_pn =  t_pn.round(System.RoundingMode.CEILING);

        // decimal d=89/QueryLimit;
        // // integer t_pn;
        // t_pn=(integer)d.round(system.RoundingMode.CEILING);
       d=a/b;

i=(integer)d.round(system.RoundingMode.CEILING);
system.debug(i);
        
    }
    public PageReference runSearch() {
        String firstName = Apexpages.currentPage().getParameters().get('firstname');   
        soql = 'select firstname, lastname,Email, Phone from contact where firstname != null';
        if (!firstName.equals(''))
          soql += ' and firstname LIKE \''+String.escapeSingleQuotes(firstName)+'%\'';
          contacts = Database.query(soql);
        return null;
      }
      public boolean getprv(){
        if(offSetSize > 0)
        	return false;
    	else
        	return true;
    }
    
    public boolean getnxt(){
        if(offSetSize + queryLimit < CountTotalRecords)
        	return false;
    	else
        	return true;
    }
    public PageReference fstbtn(){
        offSetSize = 0;
        png = 1;
        c_pn = 1;
        soql = 'select firstname, lastname, Email, Phone from contact  ORDER BY Name LIMIT :QueryLimit OFFSET :offSetSize';
        contacts = Database.query(soql);
        
    	return null;
    }

    public PageReference prvbtn(){
        offSetSize -= queryLimit ;
        png = offSetSize + 1;
        png_1 = png + test;
        c_pn --;
        soql = 'select firstname, lastname, Email, Phone from contact ORDER BY Name LIMIT :QueryLimit OFFSET :offSetSize';
        contacts = Database.query(soql);
        
    	return null;
    }
    
    public PageReference nextbtn(){
        soql = 'select firstname, lastname, Email, Phone from contact  ORDER BY Name LIMIT :QueryLimit OFFSET :offSetSize';
        contacts = Database.query(soql);
    	offSetSize += queryLimit ;
        png =offSetSize + 1;
        png_1 = png + test;
        c_pn ++;
        
    	return null;
    }
    
    public PageReference endbtn(){
        soql = 'select firstname, lastname, Email, Phone from contact  ORDER BY Name LIMIT :QueryLimit OFFSET :offSetSize';
        contacts = Database.query(soql);
        offSetSize = countTotalRecords - math.mod(countTotalRecords,queryLimit);
        png = offSetSize + 1;
        png_1 = countTotalRecords;
        c_pn = 0;
        
        
    	return null;
        
    }   
}
