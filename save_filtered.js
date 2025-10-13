const { filterEvenNumbers } = require('./filter_even.js');
const { v4: uuidv4 } = require('uuid');
const fs = require('fs');

/**
 * Filters an array for even numbers and saves the result to a randomly named JSON file.
 * @param {number[]} array - The input array of integers.
 * @param {string} directory - The directory to save the file in. Defaults to '.'.
 * @returns {string} The full path of the created file.
 */
function filterAndSaveToFile(array, directory = '.') {
  const evenNumbers = filterEvenNumbers(array);
  const randomFileName = `${uuidv4()}.json`;
  const fullPath = `${directory}/${randomFileName}`;

  fs.writeFileSync(fullPath, JSON.stringify(evenNumbers, null, 2));
  console.log(`Filtered even numbers saved to: ${fullPath}`);
  return fullPath;
}

// Example usage:
const inputArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
filterAndSaveToFile(inputArray, '/workspace');
