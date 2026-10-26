public with sharing class LOG3003_DiffTest {
// LOG-3003: test class for Org Genie git diff / token refresh check
public static Integer countActiveA() {
return [SELECT COUNT() FROM LOG3003_Test_A__c WHERE Is_Active__c = true];
}
public static List<LOG3003_Test_B__c> getBsForA(Id aId) {
return [SELECT Id, Name, Score__c, Category__c, Due_Date__c FROM LOG3003_Test_B__c WHERE Test_A__c = :aId];
}
public static Decimal avgRate() {
AggregateResult ar = [SELECT AVG(Rate__c) r FROM LOG3003_Test_C__c];
return (Decimal) ar.get('r');
}
}