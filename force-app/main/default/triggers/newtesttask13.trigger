trigger newtesttask13 on Contact (before insert) {
    if(trigger.isAfter && trigger.isInsert){
        task13.task13(trigger.new);
    }
}