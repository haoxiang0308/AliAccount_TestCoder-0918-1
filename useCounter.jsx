import { useState } from 'react';

// 自定义Hook：useCounter
// 用于管理计数器状态
const useCounter = (initialValue = 0) => {
  const [count, setCount] = useState(initialValue);

  // 增加计数器
  const increment = () => {
    setCount(prevCount => prevCount + 1);
  };

  // 减少计数器
  const decrement = () => {
    setCount(prevCount => prevCount - 1);
  };

  // 重置计数器
  const reset = () => {
    setCount(initialValue);
  };

  // 设置计数器到特定值
  const set = (value) => {
    setCount(value);
  };

  return {
    count,
    increment,
    decrement,
    reset,
    set
  };
};

export default useCounter;