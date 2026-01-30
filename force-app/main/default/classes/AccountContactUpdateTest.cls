@isTest
public class AccountContactUpdateTest {

    @isTest
    static void testContactLastModifiedDateUpdate() {

        // Create Account
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        // Create related Contact
        Contact con = new Contact(
            LastName = 'Test Contact',
            AccountId = acc.Id
        );
        insert con;

        // Update Account
        Test.startTest();
        acc.Name = 'Updated Account';
        update acc;
        Test.stopTest();

        // Re-query Contact
        Contact updatedCon = [
            SELECT LastModifiedDate
            FROM Contact
            WHERE Id = :con.Id
        ];

        System.assertNotEquals(null, updatedCon.LastModifiedDate);
    }
}
