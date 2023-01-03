({
	searchKeyChange : function(component, event, helper) {
        var myEvent = $A.get("e.c:searchKeyChange");
        myEvent.setParams({"searchKey": event.target.value});
        myEvent.fire();	
		
	}
})