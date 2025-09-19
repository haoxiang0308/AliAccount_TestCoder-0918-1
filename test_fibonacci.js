const fibonacci = require('./fibonacci_generator');

// Test the function with different values
console.log('Fibonacci sequence up to 5 terms:');
console.log(fibonacci(5));

console.log('\nFibonacci sequence up to 10 terms:');
console.log(fibonacci(10));

console.log('\nFibonacci sequence up to 15 terms:');
console.log(fibonacci(15));

console.log('\nEdge case - 0 terms:');
console.log(fibonacci(0));

console.log('\nEdge case - 1 term:');
console.log(fibonacci(1));