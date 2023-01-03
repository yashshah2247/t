trigger TotalContavtPerAccount on Contact (after insert, after update, after delete, after undelete) {
    if (trigger.isAfter && (trigger.isInsert || trigger.isUpdate || trigger.isUndelete)) {
        SampleRollupSummary.rollupContacts(trigger.new);
    }
    else if (trigger.isAfter && trigger.isDelete) {
        SampleRollupSummary.rollupContacts(trigger.old);
    }
}