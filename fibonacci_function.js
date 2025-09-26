// Function to generate Fibonacci sequence up to n terms
function fibonacci(n) {
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
// const result = fibonacci(10);
// console.log("Returned array:", result);
