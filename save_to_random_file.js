const fs = require('fs');
const path = require('path');
const { filterEvenNumbers } = require('./filter_even');

// Function to generate a random filename
function generateRandomFilename(ext = '.txt') {
    const randomString = Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);
    return randomString + ext;
}

// Main function to filter even numbers and save to a random file
function filterAndSave(inputArray, outputDir = './') {
    try {
        const evens = filterEvenNumbers(inputArray);
        const randomFilename = generateRandomFilename('.json'); // Using .json for structured data
        const fullPath = path.join(outputDir, randomFilename);

        fs.writeFileSync(fullPath, JSON.stringify(evens, null, 2));
        console.log(`Filtered even numbers saved to: ${fullPath}`);
        return fullPath;
    } catch (error) {
        console.error('An error occurred:', error.message);
    }
}

// Example usage:
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
filterAndSave(numbers, '/workspace');