const fs = require('fs');
const path = require('path');

// Include the function definition from the other file
const { filterEvenNumbers } = require('./filter_even.js');

const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);

// Generate a random filename
const randomFileName = path.join('/workspace', 'filtered_evens_' + Math.random().toString(36).substring(2, 10) + '.json');

// Write the result to the random file
fs.writeFileSync(randomFileName, JSON.stringify(evenNumbers, null, 2));
console.log('Filtered even numbers saved to:', randomFileName);