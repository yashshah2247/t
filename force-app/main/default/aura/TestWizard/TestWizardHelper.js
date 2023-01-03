({
    Accinsert : function(component, event, helper,ac_name,ac_phone,ac_emai,con_lname,con_fname,con_phone,con_email,location,s_date,e_date,subject) {
        var action = component.get("c.updateCase");
        action.setParams({ ac_name : ac_name, 
                           ac_phone : ac_phone, 
                           ac_emai : ac_emai,
                           con_lname : con_lname,
                           con_fname : con_fname, 
                           con_phone : con_phone, 
                           con_email : con_email,
                           location : location,  
                           s_date : s_date, 
                           e_date : e_date,
                           subject : subject});
        $A.enqueueAction(action);
    }
})
