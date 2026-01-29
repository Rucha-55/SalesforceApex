@isTest
public class OpportunityCloseDateTriggerTest {

    @isTest
    static void testCloseDateUpdateOnClosedWon() {

        // Step 1: Create Account
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        // Step 2: Create Opportunity
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            AccountId = acc.Id
        );
        insert opp;

        // Step 3: Update stage to Closed Won
        Test.startTest();
        opp.StageName = 'Closed Won';
        update opp;
        Test.stopTest();

        // Step 4: Verify CloseDate
        Opportunity updatedOpp = [
            SELECT CloseDate
            FROM Opportunity
            WHERE Id = :opp.Id
        ];

        System.assertEquals(
            Date.today().addMonths(1),
            updatedOpp.CloseDate
        );
    }
}
