public class Wizard {
    public String Accid;
    @AuraEnabled
    public static void updateCase(String ac_name,String ac_phone,String ac_emai,String con_lname,String con_fname,String con_phone,String con_email,String location,Date s_date, Date e_date,String subject){
        System.debug('ac_name :-' + ac_name);
        System.debug('ac_phone :-' + ac_phone);
        System.debug('ac_emai :-' + ac_emai);
        System.debug('con_lname :-' + con_lname);
        System.debug('con_fname :-' + con_fname);
        System.debug('con_phone :-' + con_phone);
        System.debug('con_email :-' + con_email);
        System.debug('location :-' + location);
        System.debug('s_date :-' + s_date);
        System.debug('e_date :-' + e_date);
        System.debug('e_date :-' + subject);
        Account ac = new Account();
        ac.Name= ac_name;
        ac.Phone = ac_phone;
        ac.email__c = ac_emai;
        insert ac;
        System.debug('accid :-' + ac.ID);
        Contact c = new Contact();
        c.Lastname= con_lname;
        c.Firstname= con_fname;
        c.AccountId =ac.ID;
        c.Phone = con_phone;
        c.Email = con_email;
        insert c;
        System.debug('con name :-' + c.Lastname);
        Event e = new Event();
        e.WhoId = c.ID;
        e.Subject = subject;
        e.StartDateTime = s_date;
        e.EndDateTime = e_date;
        insert e;
        System.debug('subject name :-' + e.Subject);

       
    }
}
