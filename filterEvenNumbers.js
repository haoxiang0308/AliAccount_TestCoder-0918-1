// Function to filter even numbers from an array and save to a random named file
function filterAndSaveEvenNumbers(inputArray) {
    // Filter even numbers from the array
    const evenNumbers = inputArray.filter(num => num % 2 === 0);
    
    // Generate a random filename
    const randomFileName = `even_numbers_${Math.floor(Math.random() * 1000000)}.json`;
    
    // Convert the array to JSON string
    const jsonString = JSON.stringify(evenNumbers, null, 2);
    
    // Write to file using Node.js fs module
    const fs = require('fs');
    fs.writeFileSync(randomFileName, jsonString);
    
    console.log(`Even numbers filtered and saved to: ${randomFileName}`);
    console.log('Filtered even numbers:', evenNumbers);
    
    return {
        filename: randomFileName,
        evenNumbers: evenNumbers
    };
}

// Example usage:
const testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
filterAndSaveEvenNumbers(testArray);

module.exports = { filterAndSaveEvenNumbers };