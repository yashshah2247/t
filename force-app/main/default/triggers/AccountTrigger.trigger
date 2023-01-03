trigger AccountTrigger on Account (before insert, before update){
    AccountHandler handler = new AccountHandler();
    handler.handleAccount(Trigger.New);
}