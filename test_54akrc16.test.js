import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders the component with the correct name', () => {
    render(<MyComponent name="John" />);
    
    expect(screen.getByText(/Hello, John!/i)).toBeInTheDocument();
  });

  test('calls onClick handler when button is clicked', () => {
    const mockOnClick = jest.fn();
    render(<MyComponent name="Jane" onClick={mockOnClick} />);
    
    const button = screen.getByText(/Click me/i);
    fireEvent.click(button);
    
    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });

  test('displays different name based on props', () => {
    render(<MyComponent name="Alice" />);
    
    expect(screen.getByText(/Hello, Alice!/i)).toBeInTheDocument();
  });
});