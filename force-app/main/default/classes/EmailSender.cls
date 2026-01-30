public class EmailSender {

    public static void sendEmail(String toAddress, String subject, String body) {

        if (String.isBlank(toAddress) || 
            String.isBlank(subject) || 
            String.isBlank(body)) {
            return;
        }

        Messaging.SingleEmailMessage mail = 
            new Messaging.SingleEmailMessage();

        mail.setToAddresses(new String[] { toAddress });
        mail.setSubject(subject);
        mail.setPlainTextBody(body);

        Messaging.sendEmail(
            new Messaging.SingleEmailMessage[] { mail }
        );
    }
}
