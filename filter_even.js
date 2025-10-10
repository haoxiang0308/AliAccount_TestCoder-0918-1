// Function to filter even numbers from an array
function filterEvenNumbers(arr) {
    return arr.filter(num => num % 2 === 0);
}

// Example usage
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);
console.log("Original array:", numbers);
console.log("Filtered even numbers:", evenNumbers);

// Save the result to a random file name
const fs = require('fs');
const crypto = require('crypto');

const randomFileName = crypto.randomBytes(12).toString('hex') + '.json';
const dataToSave = {
    originalArray: numbers,
    filteredEvenNumbers: evenNumbers
};

fs.writeFileSync(randomFileName, JSON.stringify(dataToSave, null, 2));
console.log(`Results saved to ${randomFileName}`);