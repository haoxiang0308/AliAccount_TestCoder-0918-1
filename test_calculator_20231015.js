// test_calculator_20231015.js - Mocha tests for calculator module

const { add, subtract, multiply, divide } = require('./calculator');
const { expect } = require('chai');

describe('Calculator Functions', function() {
  describe('add()', function() {
    it('should add two positive numbers correctly', function() {
      expect(add(2, 3)).to.equal(5);
    });

    it('should add negative numbers correctly', function() {
      expect(add(-2, -3)).to.equal(-5);
    });

    it('should handle adding zero', function() {
      expect(add(5, 0)).to.equal(5);
    });
  });

  describe('subtract()', function() {
    it('should subtract two positive numbers correctly', function() {
      expect(subtract(5, 3)).to.equal(2);
    });

    it('should handle negative results', function() {
      expect(subtract(3, 5)).to.equal(-2);
    });
  });

  describe('multiply()', function() {
    it('should multiply two positive numbers correctly', function() {
      expect(multiply(3, 4)).to.equal(12);
    });

    it('should handle negative numbers', function() {
      expect(multiply(-3, 4)).to.equal(-12);
    });

    it('should multiply by zero correctly', function() {
      expect(multiply(5, 0)).to.equal(0);
    });
  });

  describe('divide()', function() {
    it('should divide two positive numbers correctly', function() {
      expect(divide(8, 2)).to.equal(4);
    });

    it('should handle decimal results', function() {
      expect(divide(7, 2)).to.equal(3.5);
    });

    it('should throw an error when dividing by zero', function() {
      expect(() => divide(5, 0)).to.throw('Division by zero is not allowed');
    });
  });
});