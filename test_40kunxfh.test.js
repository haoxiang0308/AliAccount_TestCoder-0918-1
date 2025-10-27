import React from 'react';
import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders the component with the given name', () => {
    render(<MyComponent name="John" />);
    
    const headingElement = screen.getByText(/Hello, John!/i);
    expect(headingElement).toBeInTheDocument();
  });

  test('renders the component with default count when no count is provided', () => {
    render(<MyComponent name="Jane" />);
    
    const countElement = screen.getByText(/Count: 0/i);
    expect(countElement).toBeInTheDocument();
  });

  test('renders the component with the given count', () => {
    render(<MyComponent name="Bob" count={5} />);
    
    const countElement = screen.getByText(/Count: 5/i);
    expect(countElement).toBeInTheDocument();
  });

  test('renders different names correctly', () => {
    const { rerender } = render(<MyComponent name="Alice" />);
    
    expect(screen.getByText(/Hello, Alice!/i)).toBeInTheDocument();
    
    rerender(<MyComponent name="Charlie" />);
    expect(screen.getByText(/Hello, Charlie!/i)).toBeInTheDocument();
  });
});