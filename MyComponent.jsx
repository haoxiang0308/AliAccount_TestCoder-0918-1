import React from 'react';

const MyComponent = ({ name, count = 0 }) => {
  return (
    <div>
      <h1>Hello, {name}!</h1>
      <p>Count: {count}</p>
    </div>
  );
};

export default MyComponent;