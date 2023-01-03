trigger task13 on Contact (after insert) {
    if(trigger.isAfter && trigger.isInsert){
        task13.task13(trigger.new);
    }
}