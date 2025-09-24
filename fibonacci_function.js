// This file contains a Fibonacci function.

function fibonacci(n) {
  if (n <= 0) return [];
  if (n === 1) return [0];
  if (n === 2) return [0, 1];

  const sequence = [0, 1];
  for (let i = 2; i < n; i++) {
    sequence[i] = sequence[i - 1] + sequence[i - 2];
  }
  return sequence;
}

// Example usage with 10 terms
const n = 10;
const fibonacciSequence = fibonacci(n);

console.log("Fibonacci sequence up to " + n + " terms:", fibonacciSequence);

module.exports = { fibonacci, fibonacciSequence };