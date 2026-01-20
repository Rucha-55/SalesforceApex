trigger OpportunityTrigger on Opportunity (before insert, before update) {
    for (Opportunity opp : Trigger.new) {
        if (opp.Amount != null && opp.Amount > 100000) {
            opp.StageName = 'Closed Won';
        }
    }
}
