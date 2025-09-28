const assert = require('assert');

// The function to be tested
function add(a, b) {
  return a + b;
}

// Mocha test suite
describe('Addition Function', function() {
  it('should return the sum of two positive numbers', function() {
    const result = add(2, 3);
    assert.strictEqual(result, 5);
  });

  it('should return the sum of two negative numbers', function() {
    const result = add(-2, -3);
    assert.strictEqual(result, -5);
  });

  it('should return the sum of a positive and a negative number', function() {
    const result = add(5, -3);
    assert.strictEqual(result, 2);
  });

  it('should return the sum when one number is zero', function() {
    const result = add(0, 5);
    assert.strictEqual(result, 5);
  });
});
