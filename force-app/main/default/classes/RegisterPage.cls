public with sharing class RegisterPage {
    public List<Account> UserTemp = new List<Account>();
    public String f_name { get; set; }
    public String l_name { get; set; }
    public String phone_n { get; set; }
    public String email { get; set; } 
    public String pass {get;set;}
    public String acc {get;set;}
    // public String UserList {get;set;}
    // public String a_id {get;set;}
    public List<Account> a_id;
    
    public RegisterPage() {

    }
    public List<SelectOption> UserList
    {
        get
        {
            UserTemp = [Select ID,Name From Account];
            
            UserList = new List<SelectOption>();
            
            for(Account temp : UserTemp)
            {
                UserList.add(new SelectOption(temp.Id, temp.Name));
            }
            return UserList;
        }
        set;
    }
    public PageReference runSearch() {
        acc = Apexpages.currentPage().getParameters().get('S_Acc'); 
        return null;  
    }
    public void chekdata(){
        system.debug(f_name);
        system.debug(l_name);
        system.debug(phone_n);
        system.debug(email);
        system.debug(pass);
        system.debug(acc);
        // acc = 'soni';
       
        system.debug(a_id);

    }
    public void saveContact(){
        
        
    }
    public PageReference Sign()
    {
        Contact objdlt = new Contact();
        a_id = [Select ID From Account WHERE Name = 'acc'];
        objdlt.Firstname =f_name;
        objdlt.Lastname =l_name;
        objdlt.Phone=phone_n;
        objdlt.Email=email;
        objdlt.Password__c=pass;
        objdlt.AccountId = acc;
        INSERT objdlt;

        PageReference pageRef = new PageReference('https://mvclouds41-dev-ed--c.develop.vf.force.com/apex/test_login');
        aura.redirect(pageRef);
        return pageRef;
   }
}
