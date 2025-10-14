import org.junit.Test;
import static org.junit.Assert.*;

public class CalculatorAddTest {

    @Test
    public void testAdd() {
        Calculator calculator = new Calculator();
        int result = calculator.add(2, 3);
        assertEquals("2 + 3 should equal 5", 5, result);
    }

    @Test
    public void testAddWithNegativeNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(-1, 1);
        assertEquals("-1 + 1 should equal 0", 0, result);
    }

    @Test
    public void testAddWithZeros() {
        Calculator calculator = new Calculator();
        int result = calculator.add(0, 0);
        assertEquals("0 + 0 should equal 0", 0, result);
    }
}