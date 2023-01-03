trigger TheGreatProblem on Contact (before insert,before update) {
    if(trigger.isBefore && trigger.isInsert){
        TheGreatProblem.TheGreatProblem(trigger.new); 
    }
    if(trigger.isBefore && trigger.isUpdate){
        TheGreatProblem.TheGreatProblem(trigger.new); 
    }
    
}



