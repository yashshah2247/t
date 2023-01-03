public with sharing class CustomLoginController {
    public String username{get; set;}
    public String password {get; set;}
    public CustomLoginController() {
    }
    public pageReference doLogin()
{  
    return Site.login(username,password,null);
}
}
