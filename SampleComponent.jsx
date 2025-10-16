import React from 'react';

const SampleComponent = ({ title, description }) => {
  return (
    <div className="sample-component">
      <h1>{title}</h1>
      <p>{description}</p>
    </div>
  );
};

export default SampleComponent;