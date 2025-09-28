const { v4: uuidv4 } = require('uuid');

function generateFibonacci(n) {
  if (n <= 0) {
    console.log("Please enter a positive integer.");
    return [];
  } else if (n === 1) {
    console.log("Fibonacci sequence up to 1 term:");
    return [0];
  } else if (n === 2) {
    console.log("Fibonacci sequence up to 2 terms:");
    return [0, 1];
  }

  let sequence = [0, 1];
  console.log(`Fibonacci sequence up to ${n} terms:`);
  console.log(sequence[0]);
  console.log(sequence[1]);

  for (let i = 2; i < n; i++) {
    const nextTerm = sequence[i - 1] + sequence[i - 2];
    sequence.push(nextTerm);
    console.log(nextTerm);
  }

  return sequence;
}

// Example usage:
const n = 10;
const fibSequence = generateFibonacci(n);

// Generate a random filename using uuid
const randomFileName = `fibonacci_output_${uuidv4()}.js`;

// Write the function and its output to the file
const fs = require('fs');
const fileContent = `
// Generated Fibonacci function and sequence
function generateFibonacci(n) {
  if (n <= 0) {
    console.log("Please enter a positive integer.");
    return [];
  } else if (n === 1) {
    console.log("Fibonacci sequence up to 1 term:");
    return [0];
  } else if (n === 2) {
    console.log("Fibonacci sequence up to 2 terms:");
    return [0, 1];
  }

  let sequence = [0, 1];
  console.log(\`Fibonacci sequence up to \${n} terms:\`);
  console.log(sequence[0]);
  console.log(sequence[1]);

  for (let i = 2; i < n; i++) {
    const nextTerm = sequence[i - 1] + sequence[i - 2];
    sequence.push(nextTerm);
    console.log(nextTerm);
  }

  return sequence;
}

// Executing for n = ${n}
generateFibonacci(${n});
`;

fs.writeFileSync(randomFileName, fileContent);
console.log(\`\\nFunction and output saved to \${randomFileName}\`);