const { expect } = require('chai');
const { addNumbers, isEven } = require('./sampleFunction');

describe('Sample Function Tests', function() {
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
    });

    describe('isEven', function() {
        it('should return true for even numbers', function() {
            expect(isEven(4)).to.be.true;
            expect(isEven(0)).to.be.true;
            expect(isEven(-2)).to.be.true;
        });

        it('should return false for odd numbers', function() {
            expect(isEven(3)).to.be.false;
            expect(isEven(-1)).to.be.false;
            expect(isEven(7)).to.be.false;
        });

        it('should throw an error when argument is not a number', function() {
            expect(() => isEven('4')).to.throw('Argument must be a number');
        });
    });
});