({ 
    doInit : function(component, event, helper) { 
        var action = component.get("c.getContacts"); 
        action.setCallback(this, function(response){ 
            component.set("v.rec", response.getReturnValue()); 
        }); 
        $A.enqueueAction(action); 
    },
    searchKeyChange : function(component, event){
        var searchKey = event.getParam("searchKey");
        var action = component.get("c.findByName");
        //  alert(searchKey);
        action.setParams({
            "searchKey":searchKey
        });
        action.setCallback(this,function(response) {
            component.set("v.rec", response.getReturnValue())

        });
        $A.enqueueAction(action);
    }
})
