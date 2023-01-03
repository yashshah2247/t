({
    show : function(component, event, helper) {
        var val1 =component.get("v.steps");
        // var valtest =1;
        // alert(val1);
        if(val1 == 1){
            var ac_lname =component.find("ac_lname").get("v.value");
            var ac_fname =component.find("ac_fname").get("v.value");
            var ac_phone =component.find("ac_phone").get("v.value");
            var ac_email =component.find("ac_email").get("v.value");
            if(ac_lname =='' || ac_lname == null){
                component.set("v.steps",''+val1);
                component.set("v.masg",''+'Pls insert l_name');
                // alert('enter if');
  
            }
            else{
                component.set("v.ac_name",ac_lname+ac_fname);
                component.set("v.ac_lname",ac_lname);
                component.set("v.ac_fname",ac_fname);
                component.set("v.ac_phone",ac_phone);
                component.set("v.ac_email",ac_email);
                var count = parseInt(val1);
                count=count+1;
                component.set("v.steps",''+count);
                component.set("v.masg",null);
                // alert('enter else');
                    
            } 
        }
        else if(val1 == 2){
            var con_lname =component.find("con_lname").get("v.value");
            var con_fname =component.find("con_fname").get("v.value");
            var con_phone =component.find("con_phone").get("v.value");
            var con_email =component.find("con_email").get("v.value");
            if(con_lname =='' || con_lname == null || con_phone =='' || con_phone == null){
                component.set("v.steps",''+val1);
                component.set("v.masg",''+'Pls insert l_name');
                // alert('enter if');
  
            }
            else{
                component.set("v.con_name",con_lname+con_fname);
                component.set("v.con_lname",con_lname);
                component.set("v.con_fname",con_fname);
                component.set("v.ac_phone",con_phone);
                component.set("v.ac_email",con_email);
                var count = parseInt(val1);
                count=count+1;
                component.set("v.steps",''+count);
                component.set("v.masg",null);
                // alert('enter else');
            }
        }
        else if(val1 == 3){
            var location =component.find("location").get("v.value");
            var s_date =component.find("s_date").get("v.value");
            var e_date =component.find("e_date").get("v.value");
            if(location =='' || location == null || s_date =='' || s_date == null || e_date =='' || e_date == null){
                component.set("v.steps",''+val1);
                component.set("v.masg",''+'Pls insert l_name');
                // alert('enter if');
  
            }
            else{
                component.set("v.location",location);
                component.set("v.s_date",s_date);
                component.set("v.e_date",e_date);
                var count = parseInt(val1);
                count=count+1;
                component.set("v.steps",''+count);
                component.set("v.masg",null);
                // alert('enter else');
            }
        }    
    },
    call: function(component, event, helper){
        var val1 =component.get("v.steps");
        var count =parseInt(val1);
        count=count-1;
        component.set("v.steps",''+count);

    },
    invoke: function(component, event, helper){
        var ac_name =component.get("v.ac_name");
        var ac_phone =component.get("v.ac_phone");
        var ac_emai =component.get("v.ac_emai");
        var con_lname =component.get("v.con_lname");
        var con_fname =component.get("v.con_fname");
        var con_phone =component.get("v.con_phone");
        var con_email =component.get("v.con_email");
        var location =component.get("v.location");
        var s_date =component.get("v.s_date");
        var e_date =component.get("v.e_date");
        var subject =component.get("v.subject");
        alert('Submitted succesfully')
        component.set("v.start",0);
        helper.Accinsert(component, event, helper,ac_name,ac_phone,ac_emai,con_lname,con_fname,con_phone,con_email,location,s_date,e_date,subject);
        
    }
})
