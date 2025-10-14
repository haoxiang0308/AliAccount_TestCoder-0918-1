# Filter Even Numbers Utility

This project contains a JavaScript function to filter even numbers from an array and save the result to a file.

## Files

- `filter_even.js`: Contains the `filterEvenNumbers` function.
- `example_usage.js`: An example script demonstrating how to use the function and save the output.

## Usage

The `filterEvenNumbers` function takes an array of integers and returns a new array containing only the even numbers.

```javascript
const { filterEvenNumbers } = require('./filter_even.js');

const numbers = [1, 2, 3, 4, 5, 6];
const evens = filterEvenNumbers(numbers);
console.log(evens); // Output: [2, 4, 6]
```