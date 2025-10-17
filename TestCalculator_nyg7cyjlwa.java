import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class TestCalculator_nyg7cyjlwa {
    
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
        
        // Test large numbers
        assertEquals(1000000, calculator.add(500000, 500000));
    }
}