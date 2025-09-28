// Function to filter even numbers from an array
function filterEvenNumbers(inputArray) {
  if (!Array.isArray(inputArray)) {
    throw new Error("Input must be an array.");
  }
  return inputArray.filter(num => typeof num === 'number' && num % 2 === 0);
}

// Example usage:
// const numbers = [1, 2, 3, 4, 5, 6];
// const evenNumbers = filterEvenNumbers(numbers);
// console.log(evenNumbers); // Output: [2, 4, 6]

module.exports = { filterEvenNumbers };
