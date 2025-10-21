// Sample function to be tested
function addNumbers(a, b) {
    if (typeof a !== 'number' || typeof b !== 'number') {
        throw new Error('Both arguments must be numbers');
    }
    return a + b;
}

function isEven(num) {
    if (typeof num !== 'number') {
        throw new Error('Argument must be a number');
    }
    return num % 2 === 0;
}

module.exports = { addNumbers, isEven };