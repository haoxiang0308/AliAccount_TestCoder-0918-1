const fs = require('fs');
const { filterEvenNumbers } = require('./filter_even.js');

const inputArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(inputArray);
const randomFileName = `even_numbers_${Math.floor(Math.random() * 1000000)}.json`;
fs.writeFileSync(randomFileName, JSON.stringify(evenNumbers, null, 2));
console.log('Filtered even numbers saved to:', randomFileName);
