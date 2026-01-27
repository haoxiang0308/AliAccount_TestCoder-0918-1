import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import Button from './Button';

describe('Button Component', () => {
  it('renders the button with the correct label', () => {
    render(<Button label="Click me" onClick={() => {}} />);
    
    const buttonElement = screen.getByRole('button');
    expect(buttonElement).toHaveTextContent('Click me');
  });

  it('calls the onClick handler when clicked', () => {
    const handleClick = jest.fn();
    render(<Button label="Submit" onClick={handleClick} />);
    
    const buttonElement = screen.getByRole('button');
    fireEvent.click(buttonElement);
    
    expect(handleClick).toHaveBeenCalledTimes(1);
  });
});
