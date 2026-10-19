trigger CaseTrigger on Case (before insert, before update) {
    if (Trigger.isBefore && Trigger.isInsert) {
        for (Case c : Trigger.new) {
            if (String.isBlank(c.Priority)) {
                c.Priority = 'Medium';
            }
        }
    }

    if (Trigger.isBefore && Trigger.isUpdate) {
        for (Case c : Trigger.new) {
            Case oldCase = Trigger.oldMap.get(c.Id);
            if (c.Status == 'Closed' && oldCase.Status != 'Closed' && String.isBlank(c.Description)) {
                
                c.Description = 'Closed without description test2';
            }
        }
    }
}