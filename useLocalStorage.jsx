import { useState, useEffect } from 'react';

/**
 * A custom React hook that manages state in localStorage
 * @param {string} key - The localStorage key to use
 * @param {*} initialValue - The initial value for the state
 * @returns {array} An array containing the value and setValue function
 */
const useLocalStorage = (key, initialValue) => {
  const [value, setValue] = useState(() => {
    try {
      const item = window.localStorage.getItem(key);
      return item ? JSON.parse(item) : initialValue;
    } catch (error) {
      return initialValue;
    }
  });

  useEffect(() => {
    try {
      window.localStorage.setItem(key, JSON.stringify(value));
    } catch (error) {
      console.error('Error saving to localStorage:', error);
    }
  }, [key, value]);

  return [value, setValue];
};

export default useLocalStorage;