trigger task5 on Account  (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        for(Account act :  Trigger.New){
            act.Ownership = 'Public';
        }
    }
}