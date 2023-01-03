public with sharing class Dashboard_test {
    public List<Contact> lstContact;
    public List<Opportunity> lstContact_1;
    public Integer countTotalRecords{get;set;}
    public Integer countTotalRecords_1{get;set;}
    public Integer png{get;set;}
    public Integer png_1{get;set;}
    public Integer offSetSize = 0;
    public Integer offSetSize_1 = 0;
	public Integer QueryLimit = 10;
    public String loggedUserId = UserInfo.getUserId();
    
    // public Integer t_p = countTotalRecords/;
    public String name_1 { get; set;}
    public String name_2 { get; set;}
    public Dashboard_test() {
        name_1 ='Yash';
        name_2 ='hiyiu';

        lstContact = new List<Contact>();
        countTotalRecords = [SELECT count() FROM Contact where CreatedById = :loggedUserId ];
        png = 1;
        lstContact_1 = new List<Opportunity>();
        countTotalRecords_1 = [SELECT count() FROM Opportunity where CreatedById = :loggedUserId];
        png_1 = 1;
    }
    public List<Contact> getContacts(){
        lstContact = [SELECT Id, Name, Phone,Email,Birthdate FROM Contact where CreatedById = :loggedUserId ORDER BY Name LIMIT :QueryLimit OFFSET :offSetSize  ];
        return lstContact;
        
    }

    public List<Opportunity> getOpportunity()
    {   
        lstContact_1 = [SELECT Id, Name, AccountId, Amount,CloseDate,ContractId FROM Opportunity where CreatedById = :loggedUserId ORDER BY Name LIMIT :QueryLimit OFFSET :offSetSize];
        return lstContact_1;
        
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
    
    


    public boolean getprv_1(){
        if(offSetSize_1 > 0)
        	return false;
    	else
        	return true;
    }
    
    public boolean getnxt_1(){
        if(offSetSize_1 + queryLimit < CountTotalRecords_1)
        	return false;
    	else
        	return true;
    }
    
    public PageReference nextbtn_1(){
    	offSetSize_1 += queryLimit;
        png_1 =offSetSize_1;
    	return null;
    }
    
    public PageReference prvbtn_1(){
        offSetSize_1 -= queryLimit ;
        png_1 = offSetSize_1;
    	return null;
    }
    
    public PageReference fstbtn_1(){
        offSetSize_1 = 0;
        png_1 = 1;
    	return null;
    }
    
    public PageReference endbtn_1(){
        offSetSize_1 = countTotalRecords_1 - math.mod(countTotalRecords_1,queryLimit);
        png_1 = offSetSize_1;
    	return null;
    }    
}
