({
    updateDraggedCase : function(component, event, helper, caseId, status) {
        var action = component.get("c.updateCase");
        console.log(status);
        action.setParams({ caseId : caseId, 
                           status : status});
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set('v.caseWrapper',response.getReturnValue());
            }
            else if (state === "INCOMPLETE"){
                // do something
            }
            else if (state === "ERROR"){
                var errors =response.getError();
                    if(errors){
                        if (errors[0] && errors[0].message){
                            console.log("Error message : " + errors[0].message);
                        }
                    }
                    else{
                        console.log("Unknown error");
                    }
                }
        });
        $A.enqueueAction(action);
    }
})
