import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders the component with the correct name', () => {
    render(<MyComponent name="John" />);
    
    const headingElement = screen.getByText(/Hello, John!/i);
    expect(headingElement).toBeInTheDocument();
  });

  test('calls onClick handler when button is clicked', () => {
    const mockOnClick = jest.fn();
    render(<MyComponent name="Jane" onClick={mockOnClick} />);
    
    const buttonElement = screen.getByText(/Click me/i);
    fireEvent.click(buttonElement);
    
    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });

  test('displays different name based on props', () => {
    const { rerender } = render(<MyComponent name="Alice" />);
    
    expect(screen.getByText(/Hello, Alice!/i)).toBeInTheDocument();
    
    rerender(<MyComponent name="Bob" />);
    expect(screen.getByText(/Hello, Bob!/i)).toBeInTheDocument();
  });
});