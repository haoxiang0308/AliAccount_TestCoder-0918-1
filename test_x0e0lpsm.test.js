import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import SampleComponent from './SampleComponent';

describe('SampleComponent', () => {
  test('renders the component with the correct name', () => {
    render(<SampleComponent name="John" />);
    
    expect(screen.getByText(/Hello, John!/i)).toBeInTheDocument();
    expect(screen.getByText(/Click me/i)).toBeInTheDocument();
  });

  test('calls onClick function when button is clicked', () => {
    const mockOnClick = jest.fn();
    render(<SampleComponent name="Jane" onClick={mockOnClick} />);
    
    const button = screen.getByText(/Click me/i);
    fireEvent.click(button);
    
    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });

  test('displays different names correctly', () => {
    const { rerender } = render(<SampleComponent name="Alice" />);
    
    expect(screen.getByText(/Hello, Alice!/i)).toBeInTheDocument();
    
    rerender(<SampleComponent name="Bob" />);
    expect(screen.getByText(/Hello, Bob!/i)).toBeInTheDocument();
  });
});