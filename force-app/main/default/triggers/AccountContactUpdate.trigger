trigger AccountContactUpdate on Account (after update) {

    Set<Id> accountIds = new Set<Id>();

    // Collect updated Account Ids
    for (Account acc : Trigger.new) {
        accountIds.add(acc.Id);
    }

    // Get related Contacts
    List<Contact> contactsToUpdate = [
        SELECT Id
        FROM Contact
        WHERE AccountId IN :accountIds
    ];

    // Perform a dummy update to refresh LastModifiedDate
    for (Contact con : contactsToUpdate) {
        con.LastName = con.LastName; // dummy update
    }

    if (!contactsToUpdate.isEmpty()) {
        update contactsToUpdate;
    }
}
