import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

public class CalculatorAddTest_1760779014 {
    
    @Test
    public void testAdd() {
        Calculator calculator = new Calculator();
        
        // Test positive numbers
        assertEquals(5, calculator.add(2, 3));
        
        // Test negative numbers
        assertEquals(-1, calculator.add(-4, 3));
        
        // Test with zero
        assertEquals(7, calculator.add(7, 0));
        assertEquals(-3, calculator.add(0, -3));
        
        // Test both zeros
        assertEquals(0, calculator.add(0, 0));
    }
}