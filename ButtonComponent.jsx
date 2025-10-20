import React from 'react';

const ButtonComponent = ({ onClick, label, disabled = false }) => {
  return (
    <button onClick={onClick} disabled={disabled}>
      {label}
    </button>
  );
};

export default ButtonComponent;