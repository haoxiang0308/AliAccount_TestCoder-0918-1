import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class TestCalculator_d57acb3d52053b9e {
    
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
        
        // Test two negative numbers
        assertEquals(-8, calculator.add(-3, -5));
    }
}