public class SoqlPaginationOffsetController {
    public List<Contact> lstContact;
    public Integer countTotalRecords{get;set;}
    public Integer png{get;set;}
    public Integer offSetSize = 0;
	public Integer QueryLimit = 10;
    // public Integer t_p = countTotalRecords/;
    public String name_1 { get; set;}

    
    public SoqlPaginationOffsetController(){
        lstContact = new List<Contact>();
        countTotalRecords = [SELECT count() FROM Contact ];
        png = 1;
    }
    
    public List<Contact> getContacts(){
        lstContact = [SELECT Id, Name, Phone,Email,Birthdate FROM Contact ORDER BY Name LIMIT :QueryLimit OFFSET :offSetSize  ];
        return lstContact;
        
    }

    public List<Contact> searchContacts()
    {   
        lstContact = [SELECT Id, Name, Phone,Email,Birthdate FROM Contact where Name = :name_1 ORDER BY Name LIMIT :QueryLimit OFFSET :offSetSize];
        return lstContact;
        
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
    
    public PageReference nextbtn(){
    	offSetSize += queryLimit ;
        png =offSetSize;
    	return null;
    }
    
    public PageReference prvbtn(){
        offSetSize -= queryLimit ;
        png = offSetSize;
    	return null;
    }
    
    public PageReference fstbtn(){
        offSetSize = 0;
        png = 1;
    	return null;
    }
    
    public PageReference endbtn(){
        offSetSize = countTotalRecords - math.mod(countTotalRecords,queryLimit);
        png = offSetSize;
    	return null;
    }    
}