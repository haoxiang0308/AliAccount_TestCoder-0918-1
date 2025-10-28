import { useState } from 'react';

/**
 * A custom React hook that manages input state
 * @param {string} initialValue - The initial value for the input (default: "")
 * @returns {object} An object containing the value, setValue, reset, and bind functions
 */
const useInputState = (initialValue = '') => {
  const [value, setValue] = useState(initialValue);

  const reset = () => {
    setValue(initialValue);
  };

  const bind = {
    value,
    onChange: (e) => setValue(e.target.value)
  };

  return {
    value,
    setValue,
    reset,
    bind
  };
};

export default useInputState;