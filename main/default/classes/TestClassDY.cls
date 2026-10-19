public class TestClassDY implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([SELECT Id FROM Account LIMIT 1]);
    }

    public void execute(Database.BatchableContext BC, List<SObject> scope) {
        try {
            Integer i = 2 / 0;
        } catch (Exception e) {
            for (Integer j = 0; j < 1; j++) {
                Triton.log(Triton.t
                    .area(TritonTypes.Area.Accounts)
                    .exception(e)
                    .level(TritonTypes.Level.ERROR));
            }
            Triton.flush();
        }
    }

    public void finish(Database.BatchableContext BC) {
        System.debug('Test');
    }
}