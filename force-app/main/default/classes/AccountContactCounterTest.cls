@isTest
public class AccountContactCounterTest {

    @isTest
    static void testGetContactCount() {

        // Step 1: Create Account
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        // Step 2: Create Contacts related to Account
        List<Contact> conList = new List<Contact>();
        for (Integer i = 0; i < 3; i++) {
            conList.add(new Contact(
                LastName = 'Contact' + i,
                AccountId = acc.Id
            ));
        }
        insert conList;

        // Step 3: Call method
        Test.startTest();
        Integer count = AccountContactCounter.getContactCount(acc.Id);
        Test.stopTest();

        // Step 4: Verify result
        System.assertEquals(3, count);
    }
}
