import { useState, useEffect } from 'react';

/**
 * Custom hook to manage a counter with persistence in localStorage.
 * @param {string} key - The localStorage key to persist the counter value.
 * @param {number} initialValue - The initial value for the counter.
 * @returns {Array} - An array containing the current count and functions to increment, decrement, and reset the counter.
 */
const usePersistentCounter = (key, initialValue = 0) => {
  const [count, setCount] = useState(() => {
    const savedValue = localStorage.getItem(key);
    return savedValue !== null ? parseInt(savedValue, 10) : initialValue;
  });

  useEffect(() => {
    localStorage.setItem(key, count.toString());
  }, [key, count]);

  const increment = () => setCount(count + 1);
  const decrement = () => setCount(count - 1);
  const reset = () => setCount(initialValue);

  return [count, { increment, decrement, reset }];
};

export default usePersistentCounter;