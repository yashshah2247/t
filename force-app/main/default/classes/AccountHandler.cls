public class AccountHandler
{
    public Boolean handleAccount(List<Account> accList){
         
        System.debug('Trigger is executing : ' + Trigger.isExecuting);
         
        if(Trigger.isExecuting){
            //Do what ever you want to do as part of the trigger invocation
        }
        else{
            //Do what ever you want to do if the call originated from different context, such as from controller.
        }
        return Trigger.isExecuting;
    }
}