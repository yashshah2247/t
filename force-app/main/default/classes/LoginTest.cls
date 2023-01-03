public class LoginTest {
    public String u_name {get;set;}
    public String pass {get;set;}
    public String testdata {get;set;}
    
    // public List<Contact> contacts {get;set;}
    public void LoginTest() {
        // u_name ='yashshah';
        // pass = 'yash123';
        List<Contact> acc = new List<Contact>();
        acc=[SELECT ID,Email,Password__c,Name FROM Contact];
        for (Contact i : acc) {
            if(u_name == i.Email & pass == i.Password__c){
                // system.debug('use' + i.Name);
                // system.debug('use' + i.Password__c);
                // system.debug('use' + i.ID);
                testdata ='hiiiii '+ i.Name;
                // Sign();
                break;
            }
            else{
                system.debug('user name and pass is wrong');
                testdata = 'user name and pass is wrong';
            }
        }
    }
        // public PageReference step1() {
        //     system.debug('use');
        //     PageReference orderPage = new PageReference('https://mvclouds41-dev-ed--c.develop.vf.force.com/apex/new_test_task4');
        //     orderPage.setRedirect(true);
        //     return orderPage;
        // }
        // public PageReference Sign()
        //    {
            
        //     PageReference p = new PageReference('https://mvclouds41-dev-ed--c.develop.vf.force.com/apex/new_test_task4');
        //     p.setRedirect(true);
            
        //     return p;
        //     // system.debug('use');
            
        // }
}
