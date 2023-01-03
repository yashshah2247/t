trigger task3 on Opportunity (before update){
     if(Trigger.isBefore && Trigger.isUpdate){
          for(Opportunity oppRecord: Trigger.New){
               oppRecord.StageName = 'Prospecting';
               oppRecord.CloseDate = Date.Today()+15;
  
          }
  
      }

}