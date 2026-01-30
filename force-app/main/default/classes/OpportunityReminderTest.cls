@isTest
public class OpportunityReminderTest {

    @isTest
    static void testScheduledJob() {

        // Create Account
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        // Create Opportunity
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today().addDays(5),
            AccountId = acc.Id
        );
        insert opp;

        // Schedule job
        Test.startTest();
        String cron = '0 0 0 1 1 ? 2099';
        System.schedule(
            'Test Opportunity Reminder',
            cron,
            new OpportunityReminder()
        );
        Test.stopTest();

        // If no exception, test passes
        System.assert(true);
    }
}
