import org.junit.Test;
import static org.junit.Assert.*;

public class CalculatorAddTest {

    @Test
    public void testAdd_PositiveNumbers() {
        Calculator calc = new Calculator();
        int result = calc.add(2, 3);
        assertEquals("2 + 3 should equal 5", 5, result);
    }

    @Test
    public void testAdd_NegativeNumbers() {
        Calculator calc = new Calculator();
        int result = calc.add(-2, -3);
        assertEquals("-2 + (-3) should equal -5", -5, result);
    }

    @Test
    public void testAdd_Zero() {
        Calculator calc = new Calculator();
        int result = calc.add(0, 0);
        assertEquals("0 + 0 should equal 0", 0, result);
    }

    @Test
    public void testAdd_PositiveAndNegative() {
        Calculator calc = new Calculator();
        int result = calc.add(5, -3);
        assertEquals("5 + (-3) should equal 2", 2, result);
    }
}