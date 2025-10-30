import { useState } from 'react';

// 自定义Hook: useCounter
// 用于管理计数器状态
const useCounter = (initialValue = 0) => {
  const [count, setCount] = useState(initialValue);

  // 增加计数
  const increment = () => {
    setCount(prevCount => prevCount + 1);
  };

  // 减少计数
  const decrement = () => {
    setCount(prevCount => prevCount - 1);
  };

  // 重置计数
  const reset = () => {
    setCount(initialValue);
  };

  // 自定义增加计数（可指定步长）
  const increaseBy = (value) => {
    setCount(prevCount => prevCount + value);
  };

  return {
    count,
    increment,
    decrement,
    reset,
    increaseBy
  };
};

export default useCounter;