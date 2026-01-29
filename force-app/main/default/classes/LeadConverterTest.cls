@isTest
public class LeadConverterTest {

    @isTest
    static void testConvertLead() {

        // Step 1: Create Lead
        Lead testLead = new Lead(
            FirstName = 'Test',
            LastName = 'Lead',
            Company = 'Test Company',
            Status = 'Open - Not Contacted'
        );
        insert testLead;

        // Step 2: Convert Lead
        Test.startTest();
        LeadConverter.convertLead(testLead.Id);
        Test.stopTest();

        // Step 3: Verify conversion
        Lead convertedLead = [
            SELECT IsConverted, ConvertedAccountId,
                   ConvertedContactId, ConvertedOpportunityId
            FROM Lead
            WHERE Id = :testLead.Id
        ];

        System.assertEquals(true, convertedLead.IsConverted);
        System.assertNotEquals(null, convertedLead.ConvertedAccountId);
        System.assertNotEquals(null, convertedLead.ConvertedContactId);
        System.assertNotEquals(null, convertedLead.ConvertedOpportunityId);
    }
}
