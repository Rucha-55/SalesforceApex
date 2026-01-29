@isTest
public class ContactEmailUpdaterTest {

    @isTest
    static void testUpdateContactEmails() {

        // Step 1: Create sample contacts
        List<Contact> conList = new List<Contact>();
        for (Integer i = 0; i < 3; i++) {
            conList.add(new Contact(
                LastName = 'Test' + i,
                Email = 'old@email.com'
            ));
        }
        insert conList;

        // Step 2: Call method
        Test.startTest();
        ContactEmailUpdater.updateContactEmails(conList, 'new@email.com');
        Test.stopTest();

        // Step 3: Verify result
        List<Contact> updatedCons = [
            SELECT Email FROM Contact WHERE Id IN :conList
        ];

        for (Contact c : updatedCons) {
            System.assertEquals('new@email.com', c.Email);
        }
    }
}
