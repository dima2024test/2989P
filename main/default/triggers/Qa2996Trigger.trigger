trigger Qa2996Trigger on Contact (after insert) {
    // LOG-2996 QA: one INFO log per trigger execution via Triton (TritonFlow invocable, called dynamically)
    Invocable.Action action = Invocable.Action.createCustomAction('apex', 'TritonFlow');
    action.setInvocationParameter('category', 'Apex');
    action.setInvocationParameter('type', 'Backend');
    action.setInvocationParameter('area', 'Community');
    action.setInvocationParameter('level', 'INFO');
    action.setInvocationParameter('summary', 'LOG-2996 QA trigger single INFO');
    action.setInvocationParameter('details', 'Contact after insert: ' + Trigger.new[0].Id);
    action.setInvocationParameter('interviewGUID', 'qa2996-trigger');
    List<Invocable.Action.Result> res = action.invoke();
    if (!res[0].isSuccess()) { System.debug(LoggingLevel.ERROR, 'QA2996 ' + res[0].getErrors()); }
}