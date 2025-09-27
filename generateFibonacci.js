const { v4: uuidv4 } = require('uuid');

function generateFibonacci(n) {
  if (n <= 0) {
    console.log("Please enter a positive integer.");
    return [];
  } else if (n === 1) {
    console.log("Fibonacci sequence up to 1 term:");
    console.log([0]);
    return [0];
  } else if (n === 2) {
    console.log("Fibonacci sequence up to 2 terms:");
    console.log([0, 1]);
    return [0, 1];
  } else {
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
}

// Generate a random filename using uuid
const randomFileName = `/workspace/fibonacci_${uuidv4()}.js`;

// Save the function to the randomly named file
const fs = require('fs');
const functionCode = `
function generateFibonacci(n) {
  if (n <= 0) {
    console.log("Please enter a positive integer.");
    return [];
  } else if (n === 1) {
    console.log("Fibonacci sequence up to 1 term:");
    console.log([0]);
    return [0];
  } else if (n === 2) {
    console.log("Fibonacci sequence up to 2 terms:");
    console.log([0, 1]);
    return [0, 1];
  } else {
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
}
`;

fs.writeFileSync(randomFileName, functionCode);
console.log(\`JavaScript function saved to \${randomFileName}\`);