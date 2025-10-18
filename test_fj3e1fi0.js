const { expect } = require('chai');
const { addNumbers, multiplyNumbers } = require('./math_operations');

describe('Math Operations', function() {
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

    describe('multiplyNumbers', function() {
        it('should multiply two positive numbers correctly', function() {
            const result = multiplyNumbers(3, 4);
            expect(result).to.equal(12);
        });

        it('should multiply two negative numbers correctly', function() {
            const result = multiplyNumbers(-3, -4);
            expect(result).to.equal(12);
        });

        it('should multiply a positive and negative number correctly', function() {
            const result = multiplyNumbers(5, -3);
            expect(result).to.equal(-15);
        });

        it('should throw an error when one argument is not a number', function() {
            expect(() => multiplyNumbers('5', 3)).to.throw('Both arguments must be numbers');
        });
    });
});