trigger task7 on Opportunity (before update) {
    List<Task> tasks = new List<Task>();
    for(Opportunity opp : Trigger.New){
        System.debug('test');
        if(opp.Name != Trigger.oldmap.get(opp.Id).Name){
         	tasks.add(new Task(	OwnerId = opp.OwnerId, Subject = 'Follow Up Test Task  '+opp.name,Status='Completed', Priority='Normal')); 
            System.debug('yash');  
        } 
    }
    if(tasks.size() > 0){
        insert tasks;
    }
}