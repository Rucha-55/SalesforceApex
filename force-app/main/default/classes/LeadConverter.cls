public class LeadConverter {

    public static void convertLead(Id leadId) {

        // Get Lead
        Lead ld = [
            SELECT Id, Company, LastName, IsConverted
            FROM Lead
            WHERE Id = :leadId
            LIMIT 1
        ];

        // Do not convert if already converted
        if (ld.IsConverted) {
            return;
        }

        // Get converted status
        LeadStatus ls = [
            SELECT MasterLabel
            FROM LeadStatus
            WHERE IsConverted = true
            LIMIT 1
        ];

        // Lead conversion request
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(leadId);
        lc.setConvertedStatus(ls.MasterLabel);
        lc.setDoNotCreateOpportunity(false);

        // Convert lead
        Database.LeadConvertResult lcr = Database.convertLead(lc);

        // Optional check
        if (!lcr.isSuccess()) {
            for (Database.Error err : lcr.getErrors()) {
                System.debug(err.getMessage());
            }
        }
    }
}
