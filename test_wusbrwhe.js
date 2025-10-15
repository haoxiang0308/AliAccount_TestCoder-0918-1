const { addNumbers } = require('./sampleFunction');
const { expect } = require('chai');

// Mocha test for the addNumbers function
describe('addNumbers', function() {
  it('should add two positive numbers correctly', function() {
    const result = addNumbers(2, 3);
    expect(result).to.equal(5);
  });

  it('should add two negative numbers correctly', function() {
    const result = addNumbers(-2, -3);
    expect(result).to.equal(-5);
  });

  it('should add a positive and negative number correctly', function() {
    const result = addNumbers(5, -3);
    expect(result).to.equal(2);
  });

  it('should throw an error when first argument is not a number', function() {
    expect(() => addNumbers('2', 3)).to.throw('Both arguments must be numbers');
  });

  it('should throw an error when second argument is not a number', function() {
    expect(() => addNumbers(2, '3')).to.throw('Both arguments must be numbers');
  });

  it('should handle decimal numbers correctly', function() {
    const result = addNumbers(2.5, 3.7);
    expect(result).to.equal(6.2);
  });
});