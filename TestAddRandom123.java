import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class TestAddRandom123 {
    @Test
    public void testAdd() {
        Calculator calc = new Calculator();
        assertEquals(5, calc.add(2, 3));
        assertEquals(-1, calc.add(2, -3));
        assertEquals(0, calc.add(-5, 5));
    }
}