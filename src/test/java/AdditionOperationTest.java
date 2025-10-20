import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class AdditionOperationTest {
    
    @Test
    public void testAddPositiveNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(2, 3);
        assertEquals(5, result, "2 + 3 should equal 5");
    }
    
    @Test
    public void testAddNegativeNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(-2, -3);
        assertEquals(-5, result, "-2 + (-3) should equal -5");
    }
    
    @Test
    public void testAddPositiveAndNegativeNumber() {
        Calculator calculator = new Calculator();
        int result = calculator.add(5, -3);
        assertEquals(2, result, "5 + (-3) should equal 2");
    }
    
    @Test
    public void testAddWithZero() {
        Calculator calculator = new Calculator();
        int result = calculator.add(7, 0);
        assertEquals(7, result, "7 + 0 should equal 7");
    }
}