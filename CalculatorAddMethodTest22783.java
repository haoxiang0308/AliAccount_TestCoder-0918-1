import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class CalculatorAddMethodTest22783 {
    
    @Test
    public void testAddPositiveNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(2, 3);
        assertEquals(5, result);
    }
    
    @Test
    public void testAddNegativeNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(-2, -3);
        assertEquals(-5, result);
    }
    
    @Test
    public void testAddZero() {
        Calculator calculator = new Calculator();
        int result = calculator.add(0, 5);
        assertEquals(5, result);
    }
    
    @Test
    public void testAddNegativeAndPositive() {
        Calculator calculator = new Calculator();
        int result = calculator.add(-5, 10);
        assertEquals(5, result);
    }
}