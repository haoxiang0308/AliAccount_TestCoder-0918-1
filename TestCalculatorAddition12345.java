import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class TestCalculatorAddition12345 {
    
    @Test
    public void testAddPositiveNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(5, 3);
        assertEquals("Adding 5 and 3 should return 8", 8, result);
    }
    
    @Test
    public void testAddNegativeNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(-2, -3);
        assertEquals("Adding -2 and -3 should return -5", -5, result);
    }
    
    @Test
    public void testAddZero() {
        Calculator calculator = new Calculator();
        int result = calculator.add(10, 0);
        assertEquals("Adding 10 and 0 should return 10", 10, result);
    }
    
    @Test
    public void testAddPositiveAndNegative() {
        Calculator calculator = new Calculator();
        int result = calculator.add(10, -5);
        assertEquals("Adding 10 and -5 should return 5", 5, result);
    }
}