@isTest
public class BookHandlerTest {

    @isTest
    static void testCalculateAveragePrice() {

        // Step 1: Create Book records
        List<Book__c> books = new List<Book__c>{
            new Book__c(Title__c = 'Book 1', Price__c = 100),
            new Book__c(Title__c = 'Book 2', Price__c = 200),
            new Book__c(Title__c = 'Book 3', Price__c = 300)
        };
        insert books;

        // Step 2: Call method
        Test.startTest();
        Decimal avgPrice = BookHandler.calculateAveragePrice();
        Test.stopTest();

        // Step 3: Verify result
        System.assertEquals(200, avgPrice);
    }
}
