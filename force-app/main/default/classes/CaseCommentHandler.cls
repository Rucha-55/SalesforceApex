public class CaseCommentHandler {

    public static Map<Id, Integer> countCaseComments() {

        Map<Id, Integer> caseCommentCountMap = new Map<Id, Integer>();

        // Aggregate query to count comments per Case
        List<AggregateResult> results = [
            SELECT ParentId caseId, COUNT(Id) totalComments
            FROM CaseComment
            GROUP BY ParentId
        ];

        // Store results in map
        for (AggregateResult ar : results) {
            Id caseId = (Id) ar.get('caseId');
            Integer count = (Integer) ar.get('totalComments');
            caseCommentCountMap.put(caseId, count);
        }

        return caseCommentCountMap;
    }
}
