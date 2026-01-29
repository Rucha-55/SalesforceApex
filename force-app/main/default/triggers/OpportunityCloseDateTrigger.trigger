trigger OpportunityCloseDateTrigger on Opportunity (before update) {

    for (Opportunity opp : Trigger.new) {

        Opportunity oldOpp = Trigger.oldMap.get(opp.Id);

        // Check if stage changed to Closed Won
        if (opp.StageName == 'Closed Won' &&
            oldOpp.StageName != 'Closed Won') {

            opp.CloseDate = Date.today().addMonths(1);
        }
    }
}
