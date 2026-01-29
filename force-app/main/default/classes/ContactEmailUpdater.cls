public class ContactEmailUpdater {

    public static void updateContactEmails(List<Contact> conList, String newEmail) {
        if (conList == null || conList.isEmpty()) {
            return;
        }

        for (Contact c : conList) {
            c.Email = newEmail;
        }

        update conList;
    }
}
