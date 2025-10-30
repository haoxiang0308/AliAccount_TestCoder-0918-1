import React from 'react';
import useCounter from './useCounter';

const CounterExample = () => {
  // 使用自定义的useCounter Hook
  const { count, increment, decrement, reset, increaseBy } = useCounter(0);

  return (
    <div style={{ padding: '20px', textAlign: 'center' }}>
      <h2>计数器示例</h2>
      <p>当前计数: <strong>{count}</strong></p>
      
      <div style={{ margin: '10px 0' }}>
        <button onClick={increment} style={{ margin: '0 5px' }}>
          +1
        </button>
        <button onClick={decrement} style={{ margin: '0 5px' }}>
          -1
        </button>
        <button onClick={() => increaseBy(5)} style={{ margin: '0 5px' }}>
          +5
        </button>
        <button onClick={reset} style={{ margin: '0 5px' }}>
          重置
        </button>
      </div>
    </div>
  );
};

export default CounterExample;