const assert = require('assert');

// The function to be tested
function add(a, b) {
  return a + b;
}

// Mocha test suite
describe('Addition Function', function() {
  it('should return the sum of two numbers', function() {
    const result = add(2, 3);
    assert.strictEqual(result, 5);
  });

  it('should handle negative numbers', function() {
    const result = add(-1, 1);
    assert.strictEqual(result, 0);
  });

  it('should handle decimal numbers', function() {
    const result = add(0.1, 0.2);
    // Using assert.closeTo for floating point comparison
    assert.closeTo(result, 0.3, 1e-10);
  });
});
