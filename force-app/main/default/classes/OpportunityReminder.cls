global class OpportunityReminder implements Schedulable {

    global void execute(SchedulableContext sc) {

        Date today = Date.today();
        Date nextWeek = today.addDays(7);

        // Query open opportunities closing in next 7 days
        List<Opportunity> oppList = [
            SELECT Id, Name, CloseDate, Account.Name, Owner.Email
            FROM Opportunity
            WHERE IsClosed = false
            AND CloseDate >= :today
            AND CloseDate <= :nextWeek
            AND Owner.Email != null
        ];

        List<Messaging.SingleEmailMessage> emails =
            new List<Messaging.SingleEmailMessage>();

        for (Opportunity opp : oppList) {

            Messaging.SingleEmailMessage mail =
                new Messaging.SingleEmailMessage();

            mail.setToAddresses(
                new String[] { opp.Owner.Email }
            );
            mail.setSubject(
                'Reminder: Opportunity Closing Soon'
            );

            String body =
                'Opportunity Name: ' + opp.Name + '\n' +
                'Account Name: ' + opp.Account.Name + '\n' +
                'Close Date: ' + opp.CloseDate;

            mail.setPlainTextBody(body);
            emails.add(mail);
        }

        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }
}
