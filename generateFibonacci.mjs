import { v4 as uuidv4 } from 'uuid';

function generateFibonacci(n) {
  if (n <= 0) {
    console.log("Please enter a positive integer.");
    return [];
  } else if (n === 1) {
    console.log("Fibonacci sequence up to 1 term:");
    console.log([0]);
    return [0];
  }

  const sequence = [0, 1];
  console.log("Fibonacci sequence up to 2 terms:");
  console.log(sequence);

  for (let i = 2; i < n; i++) {
    const nextTerm = sequence[i - 1] + sequence[i - 2];
    sequence.push(nextTerm);
    console.log(`Term ${i + 1}: ${nextTerm}`);
  }

  console.log(`\nFinal sequence up to ${n} terms:`);
  console.log(sequence);
  return sequence;
}

// Example usage:
const n = 10; // Change this value to generate a different number of terms
generateFibonacci(n);

// Generate a random filename using uuid
const randomFileName = `fibonacci_${uuidv4()}.js`;

// Write the function definition to the random file
import fs from 'fs';
const functionCode = `
function generateFibonacci(n) {
  if (n <= 0) {
    console.log("Please enter a positive integer.");
    return [];
  } else if (n === 1) {
    console.log("Fibonacci sequence up to 1 term:");
    console.log([0]);
    return [0];
  }

  const sequence = [0, 1];

  for (let i = 2; i < n; i++) {
    const nextTerm = sequence[i - 1] + sequence[i - 2];
    sequence.push(nextTerm);
  }

  console.log("Fibonacci sequence:");
  console.log(sequence);
  return sequence;
}
`;

fs.writeFileSync(randomFileName, functionCode);
console.log("\\nFunction saved to " + randomFileName);