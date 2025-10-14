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
    // Check if the element is a number and is even
    if (typeof num !== 'number' || !Number.isInteger(num)) {
      console.warn(`Skipping non-integer value: ${num}`);
      return false;
    }
    return num % 2 === 0;
  });
}

module.exports = { filterEvenNumbers };
