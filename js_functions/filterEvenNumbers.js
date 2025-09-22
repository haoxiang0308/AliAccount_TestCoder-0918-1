/**
 * Filters even numbers from an array.
 * @param {number[]} numbers - The array of numbers to filter.
 * @returns {number[]} A new array containing only the even numbers.
 */
function filterEvenNumbers(numbers) {
    return numbers.filter(num => num % 2 === 0);
}

module.exports = filterEvenNumbers;