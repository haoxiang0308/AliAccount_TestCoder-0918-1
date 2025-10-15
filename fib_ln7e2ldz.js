/**
 * Generates the Fibonacci sequence up to n terms
 * @param {number} n - Number of terms in the sequence
 * @returns {number[]} - Array containing the Fibonacci sequence
 */
function fibonacciSequence(n) {
    if (n <= 0) {
        return [];
    } else if (n === 1) {
        return [0];
    } else if (n === 2) {
        return [0, 1];
    }
    
    const sequence = [0, 1];
    
    for (let i = 2; i < n; i++) {
        const nextTerm = sequence[i - 1] + sequence[i - 2];
        sequence.push(nextTerm);
    }
    
    return sequence;
}

// Example usage:
console.log(fibonacciSequence(10)); // [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

module.exports = { fibonacciSequence };