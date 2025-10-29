const { expect } = require('chai');
const { add, subtract, multiply, divide } = require('./mathFunctions');

describe('Math Functions', function() {
    describe('add function', function() {
        it('should add two positive numbers correctly', function() {
            expect(add(2, 3)).to.equal(5);
        });

        it('should add negative numbers correctly', function() {
            expect(add(-2, -3)).to.equal(-5);
        });

        it('should add positive and negative numbers correctly', function() {
            expect(add(5, -3)).to.equal(2);
        });
    });

    describe('subtract function', function() {
        it('should subtract two positive numbers correctly', function() {
            expect(subtract(5, 3)).to.equal(2);
        });

        it('should subtract with negative result', function() {
            expect(subtract(3, 5)).to.equal(-2);
        });

        it('should subtract negative numbers correctly', function() {
            expect(subtract(-5, -3)).to.equal(-2);
        });
    });

    describe('multiply function', function() {
        it('should multiply two positive numbers correctly', function() {
            expect(multiply(3, 4)).to.equal(12);
        });

        it('should multiply with zero correctly', function() {
            expect(multiply(5, 0)).to.equal(0);
        });

        it('should multiply negative numbers correctly', function() {
            expect(multiply(-3, 4)).to.equal(-12);
        });
    });

    describe('divide function', function() {
        it('should divide two positive numbers correctly', function() {
            expect(divide(12, 3)).to.equal(4);
        });

        it('should handle decimal results correctly', function() {
            expect(divide(7, 2)).to.equal(3.5);
        });

        it('should throw error when dividing by zero', function() {
            expect(() => divide(5, 0)).to.throw('Division by zero is not allowed');
        });

        it('should divide negative numbers correctly', function() {
            expect(divide(-12, 3)).to.equal(-4);
        });
    });
});