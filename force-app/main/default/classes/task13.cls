public with sharing class task13 {
    public static void task13(List<Contact> acc) {
        list<Event> lstevent = new list<Event>();
        for(Contact ac : acc){
            Event event = new Event();
            // Con.FirstName = 'test';
            event.OwnerId  = UserInfo.getUserId();
            // System.debug(UserInfo.getUserId());
            event.WhoId = ac.Id;
            event.WhatId = ac.AccountId;
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
}
