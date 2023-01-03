({
    doInit: function(component, event, helper) {
        helper.getAccountList(component);
    },
    searchKeyChange: function(component, event) {
        var searchKey = component.find("searchKey").get("v.value");
        
        console.log('searchKey:::::'+searchKey);
        var action = component.get("c.findByName");
        console.log('action:::::'+action);
        action.setParams({
            "searchKey": searchKey
        });
        action.setCallback(this, function(a) {
            component.set("v.accounts", a.getReturnValue());
        });
        $A.enqueueAction(action);
  
         
        var rId =searchKey;
        console.log('rId::::'+rId);
            
        var action1 = component.get("c.conList");
        console.log('action1:::::'+action1);
         action1.setParams({
            "AccName": rId
        });
        action1.setCallback(this, function(a) {
            component.set("v.Contacts", a.getReturnValue());
        });
        $A.enqueueAction(action1);
    }
})