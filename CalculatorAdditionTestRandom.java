public class CalculatorAdditionTestRandom {
    
    public static void main(String[] args) {
        CalculatorAdditionTestRandom test = new CalculatorAdditionTestRandom();
        test.runTests();
    }
    
    public void runTests() {
        System.out.println("Running Calculator Add Tests...");
        
        testAddPositiveNumbers();
        testAddNegativeNumbers();
        testAddPositiveAndNegativeNumber();
        testAddWithZero();
        testAddZeroAndZero();
        
        System.out.println("All tests passed!");
    }
    
    public void testAddPositiveNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(5, 3);
        assert result == 8 : "5 + 3 should equal 8";
        System.out.println("testAddPositiveNumbers passed");
    }
    
    public void testAddNegativeNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(-5, -3);
        assert result == -8 : "-5 + (-3) should equal -8";
        System.out.println("testAddNegativeNumbers passed");
    }
    
    public void testAddPositiveAndNegativeNumber() {
        Calculator calculator = new Calculator();
        int result = calculator.add(10, -3);
        assert result == 7 : "10 + (-3) should equal 7";
        System.out.println("testAddPositiveAndNegativeNumber passed");
    }
    
    public void testAddWithZero() {
        Calculator calculator = new Calculator();
        int result = calculator.add(5, 0);
        assert result == 5 : "5 + 0 should equal 5";
        System.out.println("testAddWithZero passed");
    }
    
    public void testAddZeroAndZero() {
        Calculator calculator = new Calculator();
        int result = calculator.add(0, 0);
        assert result == 0 : "0 + 0 should equal 0";
        System.out.println("testAddZeroAndZero passed");
    }
}