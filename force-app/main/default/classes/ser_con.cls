public with sharing class ser_con {
    public List<Contact> lstContact;
    public Integer countTotalRecords{get;set;}
    public Integer offSetSize = 0;
	public Integer QueryLimit = 10;
    
    public ser_con(){
        lstContact = new List<Contact>();
        countTotalRecords = [SELECT count() FROM Contact];
    }
    
    public List<Contact> getContacts(){
        lstContact = [SELECT Id, Name, Phone FROM Contact ORDER BY Name LIMIT :QueryLimit OFFSET :offSetSize];
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
    	return null;
    }
    
    public PageReference prvbtn(){
        offSetSize -= queryLimit ;
    	return null;
    }
    
    public PageReference fstbtn(){
        offSetSize = 0;
    	return null;
    }
    
    public PageReference endbtn(){
        offSetSize = countTotalRecords - math.mod(countTotalRecords,queryLimit);
    	return null;
    }    
}
