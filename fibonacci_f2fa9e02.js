/**
 * Generates the Fibonacci sequence up to n terms
 * @param {number} n - Number of terms to generate
 * @returns {Array} - Array containing the Fibonacci sequence
 */
function fibonacciSequence(n) {
    if (n <= 0) return [];
    if (n === 1) return [0];
    if (n === 2) return [0, 1];
    
    const sequence = [0, 1];
    
    for (let i = 2; i < n; i++) {
        sequence[i] = sequence[i - 1] + sequence[i - 2];
    }
    
    return sequence;
}

// Example usage
const n = 10;
console.log(`Fibonacci sequence up to ${n} terms:`, fibonacciSequence(n));

module.exports = { fibonacciSequence };
