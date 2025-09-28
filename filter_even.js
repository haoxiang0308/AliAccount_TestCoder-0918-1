// Function to filter even numbers from an array
function filterEvenNumbers(numbers) {
  return numbers.filter(num => num % 2 === 0);
}

// Example usage:
const inputArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(inputArray);
console.log("Original array:", inputArray);
console.log("Filtered even numbers:", evenNumbers);

// Export the function for potential reuse
module.exports = { filterEvenNumbers };
