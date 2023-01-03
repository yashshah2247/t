({
    doInit: function(component, event, helper) {
        
        var action = component.get("c.getCases");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                component.set('v.caseWrapper',response.getReturnValue());
                // console.log("hiiiids");
                // alert("From Server: "+ JSON.stringify(response.getReturnValue()));
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
    },
    dragstart: function(component, event, helper) {
        // console.log(event.target.id);
        event.dataTransfer.setData('Text',event.target.id);
    },
    allDrop: function(component, event, helper) {
        event.preventDefault();

    },
    onNewDrop: function(component, event, helper) {
        console.log(event.dataTransfer.getData('Text',event.target.id));
        helper.updateDraggedCase(component, event, helper,event.dataTransfer.getData('Text',event.target.id),'New');
        
    },
    onWorkingDrop: function(component, event, helper) {
        console.log(event.dataTransfer.getData('Text',event.target.id));
        helper.updateDraggedCase(component, event, helper,event.dataTransfer.getData('Text',event.target.id),'Working');
        
    },
    onClosedDrop: function(component, event, helper) {
        console.log(event.dataTransfer.getData('Text',event.target.id));
        helper.updateDraggedCase(component, event, helper,event.dataTransfer.getData('Text',event.target.id),'Closed');
        
    }

})