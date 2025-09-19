import { useState } from 'react';

/**
 * A custom React hook for managing a counter state.
 * @param {number} initialCount - The initial value for the counter. Defaults to 0.
 * @returns {Object} An object containing the current count and functions to increment, decrement, and reset the counter.
 */
const useCounter = (initialCount = 0) => {
  const [count, setCount] = useState(initialCount);

  const increment = () => setCount(c => c + 1);
  const decrement = () => setCount(c => c - 1);
  const reset = () => setCount(initialCount);

  return { count, increment, decrement, reset };
};

export default useCounter;