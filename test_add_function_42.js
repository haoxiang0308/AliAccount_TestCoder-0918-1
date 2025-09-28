const { add } = require('./test_function.js');
const assert = require('assert');

describe('Add Function', function() {
  it('should add two positive numbers correctly', function() {
    const result = add(2, 3);
    assert.strictEqual(result, 5);
  });

  it('should add two negative numbers correctly', function() {
    const result = add(-2, -3);
    assert.strictEqual(result, -5);
  });

  it('should add a positive and a negative number correctly', function() {
    const result = add(5, -3);
    assert.strictEqual(result, 2);
  });

  it('should throw an error if the first argument is not a number', function() {
    assert.throws(() => add('2', 3), { message: 'Both arguments must be numbers' });
  });

  it('should throw an error if the second argument is not a number', function() {
    assert.throws(() => add(2, '3'), { message: 'Both arguments must be numbers' });
  });
});