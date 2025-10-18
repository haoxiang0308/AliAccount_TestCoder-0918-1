const { expect } = require('chai');
const { addNumbers, capitalize } = require('./utils');

describe('Utility Functions Test Suite', function() {
  describe('addNumbers function', function() {
    it('should add two positive numbers correctly', function() {
      const result = addNumbers(2, 3);
      expect(result).to.equal(5);
    });

    it('should add two negative numbers correctly', function() {
      const result = addNumbers(-2, -3);
      expect(result).to.equal(-5);
    });

    it('should add a positive and a negative number correctly', function() {
      const result = addNumbers(5, -3);
      expect(result).to.equal(2);
    });

    it('should throw an error when first argument is not a number', function() {
      expect(() => addNumbers('2', 3)).to.throw('Both arguments must be numbers');
    });

    it('should throw an error when second argument is not a number', function() {
      expect(() => addNumbers(2, '3')).to.throw('Both arguments must be numbers');
    });
  });

  describe('capitalize function', function() {
    it('should capitalize the first letter of a string', function() {
      const result = capitalize('hello');
      expect(result).to.equal('Hello');
    });

    it('should handle a single character', function() {
      const result = capitalize('a');
      expect(result).to.equal('A');
    });

    it('should convert the rest of the string to lowercase', function() {
      const result = capitalize('hELLo');
      expect(result).to.equal('Hello');
    });

    it('should throw an error when argument is not a string', function() {
      expect(() => capitalize(123)).to.throw('Argument must be a string');
    });

    it('should handle empty string', function() {
      const result = capitalize('');
      expect(result).to.equal('');
    });
  });
});