/**
 * Filters even numbers from an array of integers.
 * @param {number[]} array - The input array of integers.
 * @returns {number[]} A new array containing only the even numbers.
 */
function filterEvenNumbers(array) {
  if (!Array.isArray(array)) {
    throw new Error("Input must be an array.");
  }
  return array.filter(num => {
    if (typeof num !== 'number' || !Number.isInteger(num)) {
      throw new Error("Array must contain only integers.");
    }
    return num % 2 === 0;
  });
}

module.exports = { filterEvenNumbers };
