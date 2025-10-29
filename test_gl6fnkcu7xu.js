const { expect } = require('chai');
const { add, subtract, multiply } = require('./utils');

describe('Utility Functions', () => {
  describe('add function', () => {
    it('should add two positive numbers correctly', () => {
      expect(add(2, 3)).to.equal(5);
    });

    it('should add negative numbers correctly', () => {
      expect(add(-2, -3)).to.equal(-5);
    });

    it('should add positive and negative numbers correctly', () => {
      expect(add(5, -3)).to.equal(2);
    });
  });

  describe('subtract function', () => {
    it('should subtract two numbers correctly', () => {
      expect(subtract(5, 3)).to.equal(2);
    });

    it('should subtract with negative result', () => {
      expect(subtract(3, 5)).to.equal(-2);
    });

    it('should handle negative numbers in subtraction', () => {
      expect(subtract(-5, -3)).to.equal(-2);
    });
  });

  describe('multiply function', () => {
    it('should multiply two positive numbers correctly', () => {
      expect(multiply(3, 4)).to.equal(12);
    });

    it('should multiply with zero correctly', () => {
      expect(multiply(5, 0)).to.equal(0);
    });

    it('should multiply negative numbers correctly', () => {
      expect(multiply(-3, 4)).to.equal(-12);
    });
  });
});