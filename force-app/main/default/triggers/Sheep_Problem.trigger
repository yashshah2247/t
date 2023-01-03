/* trigger is used so that whenever a contact is updated, it should update all contacts related
 to its parent account with the name of the contact.*/
trigger Sheep_Problem on Contact (after update) {
    // if(trigger.isBefore)
    Sheep_Problem.Sheep_Problem(trigger.old,trigger.new,trigger.oldMap,trigger.newMap);
}