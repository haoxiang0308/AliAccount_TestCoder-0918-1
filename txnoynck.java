import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

// Simple Calculator class for demonstration
class Calculator {
    public int add(int a, int b) {
        return a + b;
    }
}

public class txnoynck {
    
    @Test
    public void testAddMethod() {
        Calculator calculator = new Calculator();
        
        // Test positive numbers
        assertEquals(5, calculator.add(2, 3), "2 + 3 should equal 5");
        
        // Test with zero
        assertEquals(7, calculator.add(7, 0), "7 + 0 should equal 7");
        assertEquals(3, calculator.add(0, 3), "0 + 3 should equal 3");
        
        // Test with negative numbers
        assertEquals(-1, calculator.add(-4, 3), "-4 + 3 should equal -1");
        assertEquals(-7, calculator.add(-4, -3), "-4 + -3 should equal -7");
        
        // Test with large numbers
        assertEquals(1000000, calculator.add(500000, 500000), "500000 + 500000 should equal 1000000");
    }
}