const { add } = require('../src/utils');

// Mocha test suite for the add function
describe('Add Function', function() {
  it('should add two positive numbers correctly', function() {
    const result = add(2, 3);
    // Assertion
    if (result !== 5) {
      throw new Error(`Expected 5, but got ${result}`);
    }
  });

  it('should add two negative numbers correctly', function() {
    const result = add(-2, -3);
    // Assertion
    if (result !== -5) {
      throw new Error(`Expected -5, but got ${result}`);
    }
  });

  it('should add a positive and a negative number correctly', function() {
    const result = add(5, -3);
    // Assertion
    if (result !== 2) {
      throw new Error(`Expected 2, but got ${result}`);
    }
  });

  it('should throw an error if the first argument is not a number', function() {
    try {
      add('2', 3);
      // If no error is thrown, the test fails
      throw new Error('Expected function to throw an error');
    } catch (error) {
      if (error.message !== 'Both arguments must be numbers') {
        throw error; // Re-throw if it's a different error than expected
      }
    }
  });

  it('should throw an error if the second argument is not a number', function() {
    try {
      add(2, '3');
      // If no error is thrown, the test fails
      throw new Error('Expected function to throw an error');
    } catch (error) {
      if (error.message !== 'Both arguments must be numbers') {
        throw error; // Re-throw if it's a different error than expected
      }
    }
  });
});