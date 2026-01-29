public class AccountContactCounter {

    public static Integer getContactCount(Id accountId) {

        if (accountId == null) {
            return 0;
        }

        Integer contactCount = [
            SELECT COUNT()
            FROM Contact
            WHERE AccountId = :accountId
        ];

        return contactCount;
    }
}
