import { useState } from 'react';

/**
 * A custom React hook that manages a toggle state
 * @param {boolean} initialValue - The initial value for the toggle (default: false)
 * @returns {object} An object containing the value, toggle, setTrue, setFalse functions
 */
const useRandomHook = (initialValue = false) => {
  const [value, setValue] = useState(initialValue);

  const toggle = () => {
    setValue(prevValue => !prevValue);
  };

  const setTrue = () => {
    setValue(true);
  };

  const setFalse = () => {
    setValue(false);
  };

  return {
    value,
    toggle,
    setTrue,
    setFalse
  };
};

export default useRandomHook;