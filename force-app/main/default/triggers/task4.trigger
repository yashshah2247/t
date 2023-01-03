trigger task4 on Opportunity (before insert) {

    if(Trigger.isBefore && Trigger.isInsert){

        for(Opportunity oppRecord: Trigger.New){

           oppRecord.Type = 'New Customer';

        }

    }

}