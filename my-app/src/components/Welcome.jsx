import React from 'react';

const Welcome = ({ name = 'World' }) => {
  return <h1>Hello, {name}!</h1>;
};

export default Welcome;