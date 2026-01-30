@isTest
public class CaseCommentHandlerTest {

    @isTest
    static void testCountCaseComments() {

        // Create Case
        Case cs = new Case(
            Subject = 'Test Case',
            Status = 'New',
            Origin = 'Phone'
        );
        insert cs;

        // Create Case Comments
        List<CaseComment> comments = new List<CaseComment>{
            new CaseComment(ParentId = cs.Id, CommentBody = 'Comment 1'),
            new CaseComment(ParentId = cs.Id, CommentBody = 'Comment 2')
        };
        insert comments;

        // Call method
        Map<Id, Integer> resultMap =
            CaseCommentHandler.countCaseComments();

        // Verify result
        System.assertEquals(2, resultMap.get(cs.Id));
    }
}
