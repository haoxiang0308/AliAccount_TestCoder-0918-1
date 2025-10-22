import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class TestCalculator894bd4d9b755f35d {
    
    @Test
    public void testAdd() {
        Calculator calculator = new Calculator();
        
        // Test positive numbers
        assertEquals(5, calculator.add(2, 3));
        
        // Test negative numbers
        assertEquals(-1, calculator.add(-4, 3));
        
        // Test zero
        assertEquals(7, calculator.add(7, 0));
        assertEquals(-3, calculator.add(-3, 0));
        
        // Test both zeros
        assertEquals(0, calculator.add(0, 0));
        
        // Test negative numbers
        assertEquals(-8, calculator.add(-5, -3));
    }
}