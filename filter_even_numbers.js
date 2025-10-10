const { v4: uuidv4 } = require('uuid');

function filterEvenNumbers(inputArray) {
  if (!Array.isArray(inputArray)) {
    throw new Error('Input must be an array.');
  }
  return inputArray.filter(num => typeof num === 'number' && num % 2 === 0);
}

function saveFilteredNumbersToFile(inputArray) {
  const evenNumbers = filterEvenNumbers(inputArray);
  const filename = `/workspace/output_${uuidv4()}.txt`;
  const fs = require('fs');
  fs.writeFileSync(filename, evenNumbers.join('\n'));
  console.log(`Filtered even numbers saved to ${filename}`);
  return filename;
}

// Example usage:
// const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
// saveFilteredNumbersToFile(numbers);
module.exports = { filterEvenNumbers, saveFilteredNumbersToFile };
