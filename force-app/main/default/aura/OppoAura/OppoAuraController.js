({

    doInit : function(component, event, helper){
        var pageSize = component.get("v.pageSize");       
        var action = component.get("c.getOpportunities");      
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS"){
                component.set('v.opportunityList', response.getReturnValue());              
                component.set("v.totalSize", component.get("v.opportunityList").length);  
                var t_p = component.get("v.opportunityList").length;       
                component.set("v.start",0);              
                component.set("v.end",pageSize-1);   
                component.set("v.c_page",1);           
                var paginationList = []; 
                for(var i=0; i< pageSize; i++){
                    paginationList.push(response.getReturnValue()[i]);
                }   
                component.set('v.paginationList', paginationList);
                component.set('v.total_page', Math.ceil(t_p/pageSize));
                
            }
            
    
        });
        $A.enqueueAction(action);
    
    },

    searchKeyChange: function(component, event) {
        console.log('teat searchKeyChange>>'); 
        var pageSize = component.get("v.pageSize");
        // var tt = event.currentTarget.value;
        // console.log('tt', tt);
        var searchKey =  component.find("input1").get("v.value");
        console.log(searchKey);
        var action = component.get("c.getByName");
        var keysize = component.get("v.totalSize");
        action.setParams({
            "searchKey": searchKey
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS"){         
                component.set('v.opportunityList', response.getReturnValue());            
                component.set("v.totalSize", component.get("v.opportunityList").length); 
                component.set("v.start",0);              
                component.set("v.end",pageSize-1);                        
                var paginationList = [];            
                for(var i=0; i< pageSize; i++){
                    paginationList.push(response.getReturnValue()[i]);
            
                }
                component.set('v.paginationList', paginationList);
            }
    
        }); 
        $A.enqueueAction(action); 
    },
    first : function(component, event, helper){
        console.log(" clik first ");
        var oppList = component.get("v.opportunityList");
        var pageSize = component.get("v.pageSize");
        var paginationList = [];
        var start = component.get("v.start");
        var end = component.get("v.end");
        var counter = 0;
        for(var i=0; i< pageSize; i++) {
            paginationList.push(oppList[i]);
            counter ++;
        }
        // end = end + counter;
        component.set("v.end",5);
        component.set("v.start",0);
        component.set('v.paginationList', paginationList);
        component.set("v.c_page",1);
        
    },
    previous : function(component, event, helper){
        console.log(" clik previous ");
        var oppList = component.get("v.opportunityList");
        var c_p = component.get("v.c_page");
        var end = component.get("v.end");
        var start = component.get("v.start");
        var pageSize = component.get("v.pageSize");
        var paginationList = [];
        var counter = 0;
        for(var i= start-pageSize; i < start ; i++){
            if(i >-1){
                console.log(" Hello ");
                paginationList.push(oppList[i]);
                counter ++;
            }
            else {
                start++;
            }
        }
            start = start - counter;
            end = end - counter;
            component.set("v.start",start);
            component.set("v.end",end);
            component.set('v.paginationList', paginationList);
            component.set("v.c_page",c_p-1);
    },
    next : function(component, event, helper){
        console.log(" clik next ");
        var oppList = component.get("v.opportunityList");
        var c_p = component.get("v.c_page");
        var end = component.get("v.end");
        var start = component.get("v.start");
        var pageSize = component.get("v.pageSize");
        var paginationList = [];
        var counter = 0;
        for(var i=end+1; i<end+pageSize+1; i++){
            if(oppList.length > end){
                paginationList.push(oppList[i]);
                counter ++ ;
            }
        }
        start = start + counter;
        end = end + counter;
        component.set("v.start",start);
        component.set("v.end",end);
        component.set('v.paginationList', paginationList);
        component.set("v.c_page",c_p+1);
    },
    last : function(component, event, helper){
        console.log(" clik last ");
        var oppList = component.get("v.opportunityList");
        var pageSize = component.get("v.pageSize");
        var totalSize = component.get("v.totalSize");
        var start = component.get("v.start");
        var counter = 0;
        var paginationList = [];
        for(var i=totalSize-pageSize+1; i< totalSize; i++){
            paginationList.push(oppList[i]);
            counter ++ ;
        }
        component.set("v.start",totalSize-counter);
        component.set("v.end",totalSize);
        component.set("v.totalSize", component.get("v.opportunityList").length);  
        var t_p = component.get("v.opportunityList").length;
        component.set("v.c_page",Math.ceil(t_p/pageSize));
        component.set('v.paginationList', paginationList);
        
    }
    
    
})