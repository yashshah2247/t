public class show_msg {
        public string aname {set;get;}
        public string aphone {set;get;}
        public string aid {set;get;}

        public void ml(){
            account ac = new account();
                ac.Name = aname;
                ac.phone = aphone;
                ac.ID = aid;
            insert ac;
            
            apexpages.Message msg = new apexpages.Message(apexpages.Severity.CONFIRM, aname + ' Inserted Successfully..');
            apexpages.addMeSSage(msg);
        
     
        }  
}