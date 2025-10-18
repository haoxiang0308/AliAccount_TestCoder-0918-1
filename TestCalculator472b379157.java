import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class TestCalculator472b379157 {
    @Test
    public void testAdd() {
        Calculator calculator = new Calculator();
        
        // Test positive numbers
        assertEquals(5, calculator.add(2, 3));
        
        // Test negative numbers
        assertEquals(-1, calculator.add(-4, 3));
        
        // Test zero
        assertEquals(7, calculator.add(7, 0));
        assertEquals(9, calculator.add(0, 9));
        
        // Test both negative
        assertEquals(-8, calculator.add(-3, -5));
    }
}