trigger testtask13 on Contact (after insert) {
    list<Event> lstevent = new list<Event>();
    for(Contact Acc: trigger.new){
        Event event = new Event();
        // Con.FirstName = 'test';
        event.OwnerId  = UserInfo.getUserId();
        // System.debug(UserInfo.getUserId());
        event.WhoId = Acc.Id;
        event.WhatId = Acc.AccountId;
        event.Subject = 'Email';
        // event.Subject = 'Email';
        event.StartDateTime = System.now();
        event.EndDateTime = System.now()+1;
        lstevent.Add(event);
    }
    System.debug(lstevent);
    System.debug('hiii');
    insert lstevent;

}