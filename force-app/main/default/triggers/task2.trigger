trigger task2 on Lead (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        for(Lead le_record: Trigger.New){
            le_record.Rating = 'Hot';
        }
    }
}