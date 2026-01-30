public class BookHandler {

    public static Decimal calculateAveragePrice() {

        List<Book__c> books = [
            SELECT Price__c
            FROM Book__c
            WHERE Price__c != null
        ];

        if (books.isEmpty()) {
            return 0;
        }

        Decimal totalPrice = 0;
        for (Book__c b : books) {
            totalPrice += b.Price__c;
        }

        return totalPrice / books.size();
    }
}
