function fibonacciSequence(n) {
    if (n <= 0) {
        console.log("Please enter a positive number");
        return [];
    } else if (n === 1) {
        console.log("Fibonacci sequence:");
        console.log(0);
        return [0];
    } else if (n === 2) {
        console.log("Fibonacci sequence:");
        console.log(0);
        console.log(1);
        return [0, 1];
    }

    let sequence = [0, 1];
    console.log("Fibonacci sequence:");
    console.log(0);
    console.log(1);

    for (let i = 2; i < n; i++) {
        let nextTerm = sequence[i - 1] + sequence[i - 2];
        sequence.push(nextTerm);
        console.log(nextTerm);
    }

    return sequence;
}

// Export the function for use in other files
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { fibonacciSequence };
}

// Example usage:
// fibonacciSequence(10);