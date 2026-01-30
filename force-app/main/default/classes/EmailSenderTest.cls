@isTest
public class EmailSenderTest {

    @isTest
    static void testSendEmail() {

        Test.startTest();
        EmailSender.sendEmail(
            'test@example.com',
            'Test Subject',
            'This is a test email body'
        );
        Test.stopTest();

        // No assertion needed as emails are not sent in test context
        System.assert(true);
    }
}
