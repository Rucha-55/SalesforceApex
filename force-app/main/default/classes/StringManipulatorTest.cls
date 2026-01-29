@isTest
public class StringManipulatorTest {

    @isTest
    static void testReverseString() {

        // Test case 1: Normal string
        String result1 = StringManipulator.reverseString('Salesforce');
        System.assertEquals('ecrofelaS', result1);

        // Test case 2: Single character
        String result2 = StringManipulator.reverseString('A');
        System.assertEquals('A', result2);

        // Test case 3: Empty string
        String result3 = StringManipulator.reverseString('');
        System.assertEquals('', result3);

        // Test case 4: Null value
        String result4 = StringManipulator.reverseString(null);
        System.assertEquals(null, result4);
    }
}
