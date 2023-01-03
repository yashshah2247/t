
trigger task8 on Account (before insert) {
    for(Account acc : Trigger.New){
        acc.Name = 'Mr.'+acc.Name;
    }
}

