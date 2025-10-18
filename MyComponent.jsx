import React from 'react';

const MyComponent = ({ title, children }) => {
  return (
    <div className="my-component">
      <h1>{title}</h1>
      <p>{children}</p>
    </div>
  );
};

export default MyComponent;