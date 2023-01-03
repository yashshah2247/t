({
    doInit : function(component, event, helper) {
        
    },
    searchKeyChange: function(component, event) {
        var searchKey = component.find("searchKey").get("v.value");
        
        console.log('searchKey:::::'+searchKey);
        var action = component.get("c.findByName");
        var action1 = component.get("c.countCon1");
        console.log('action:::::'+action);
        action.setParams({
            "searchKey": searchKey
        });
        action.setCallback(this, function(a) {
            var values = a.getReturnValue();
            console.log({values});
            component.set("v.accounts", a.getReturnValue());
        });
        action1.setCallback(this, function(a) {
            component.set("v.con1Name", a.getReturnValue());
            console.log('code:::::'+ JSON.stringify(a.getReturnValue()));
        });
        $A.enqueueAction(action);
        $A.enqueueAction(action1);
    },
    searchKeyChange_2: function(component, event) {
        var searchKey = component.find("searchKey_2").get("v.value");
        
        console.log('searchKey:::::'+searchKey);
        var action = component.get("c.findByName_2");
        console.log('action:::::'+action);
        action.setParams({
            "searchKey": searchKey
        });
        action.setCallback(this, function(a) {
            component.set("v.accounts_2", a.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    dragstart: function(component, event, helper) {
        // console.log(event.target.id);
        event.dataTransfer.setData('Text',event.target.id);
    },
    allDrop: function(component, event, helper) {
        event.preventDefault();
        // console.log("acc id :- "+event.target.id);
        var te = event.target.id;
       console.log("te :-"+te);
       component.set("v.accid",te);

    },
    onNewDrop: function(component, event, helper) {
        var testacc = component.get("v.accid");
        console.log("con id :- "+event.dataTransfer.getData('Text',event.target.id));
        // console.log("acc id :- "+event.dataTransfer.getData('Text',event.target.id));
        helper.updateDraggedCase(component, event, helper,event.dataTransfer.getData('Text',event.target.id),testacc);
        $A.enqueueAction(component.get('c.searchKeyChange'));
        $A.enqueueAction(component.get('c.searchKeyChange_2'));
        
    }
})








