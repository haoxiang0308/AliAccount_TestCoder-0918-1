import React from 'react';

const MyComponent = ({ name, onClick }) => {
  return (
    <div>
      <h1>Hello, {name}!</h1>
      <button onClick={onClick}>Click me</button>
    </div>
  );
};

export default MyComponent;