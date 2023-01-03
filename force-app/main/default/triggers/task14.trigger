trigger task14 on Account (before insert , after insert) {
    if(trigger.isInsert && trigger.isBefore){
        task14.testdelete(trigger.new);
    }
}