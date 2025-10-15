import React from 'react';

const SimpleComponent = ({ name = 'World' }) => {
  return <div>Hello, {name}!</div>;
};

export default SimpleComponent;