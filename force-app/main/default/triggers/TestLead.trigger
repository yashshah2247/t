trigger TestLead on Lead (after update) {
    List<Lead> led = new List<Lead>();
    for(Lead a : Trigger.new) {
        
        system.debug(a.Rating);
        if(a.Rating=='Hot'){
            Lead con_1 = new Lead();
            con_1.LastName = a.Name+'test';
            con_1.Company ='Mv clouds';
            con_1.LeadSource ='Open - Not Contacted';
            led.add(con_1);
            // Lead b = new Lead(Lastname='Test Trigger',Company='Mv clouds',LeadSource ='Open - Not Contacted');
            // insert b;
            system.debug('create lead');
        }
        else{
            system.debug('not create lead');
        }
    }
    Insert led;      
}