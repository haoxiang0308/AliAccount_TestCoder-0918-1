import React from 'react';

const Button = ({ onClick, children, disabled }) => {
  return (
    &lt;button onClick={onClick} disabled={disabled}&gt;
      {children}
    &lt;/button&gt;
  );
};

export default Button;