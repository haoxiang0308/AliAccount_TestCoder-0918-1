const { expect } = require('chai');
const { add, subtract, multiply } = require('./calculate');

describe('Calculate functions', () => {
  describe('add function', () => {
    it('should add two positive numbers correctly', () => {
      const result = add(2, 3);
      expect(result).to.equal(5);
    });

    it('should add negative numbers correctly', () => {
      const result = add(-2, -3);
      expect(result).to.equal(-5);
    });

    it('should add positive and negative numbers correctly', () => {
      const result = add(5, -3);
      expect(result).to.equal(2);
    });
  });

  describe('subtract function', () => {
    it('should subtract two positive numbers correctly', () => {
      const result = subtract(5, 3);
      expect(result).to.equal(2);
    });

    it('should subtract negative numbers correctly', () => {
      const result = subtract(-5, -3);
      expect(result).to.equal(-2);
    });

    it('should subtract when first number is smaller', () => {
      const result = subtract(3, 5);
      expect(result).to.equal(-2);
    });
  });

  describe('multiply function', () => {
    it('should multiply two positive numbers correctly', () => {
      const result = multiply(3, 4);
      expect(result).to.equal(12);
    });

    it('should multiply negative and positive numbers correctly', () => {
      const result = multiply(-3, 4);
      expect(result).to.equal(-12);
    });

    it('should multiply two negative numbers correctly', () => {
      const result = multiply(-3, -4);
      expect(result).to.equal(12);
    });

    it('should multiply by zero correctly', () => {
      const result = multiply(5, 0);
      expect(result).to.equal(0);
    });
  });
});