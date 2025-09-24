const assert = require('assert');
const add = (a, b) => a + b; // The function to be tested

describe('Add Function', function() {
  it('should return the sum of two numbers', function() {
    assert.strictEqual(add(2, 3), 5);
    assert.strictEqual(add(-1, 1), 0);
    assert.strictEqual(add(0, 0), 0);
  });
});