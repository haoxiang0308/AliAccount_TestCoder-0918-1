import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import Counter from './Counter';

describe('Counter Component', () => {
  test('renders with initial count', () => {
    render(<Counter initialCount={5} />);
    expect(screen.getByText('Count: 5')).toBeInTheDocument();
  });

  test('increments count when increment button is clicked', () => {
    render(<Counter />);
    const incrementButton = screen.getByText('Increment');
    fireEvent.click(incrementButton);
    expect(screen.getByText('Count: 1')).toBeInTheDocument();
  });

  test('decrements count when decrement button is clicked', () => {
    render(<Counter />);
    const decrementButton = screen.getByText('Decrement');
    fireEvent.click(decrementButton);
    expect(screen.getByText('Count: -1')).toBeInTheDocument();
  });

  test('resets count when reset button is clicked', () => {
    render(<Counter initialCount={3} />);
    const incrementButton = screen.getByText('Increment');
    const resetButton = screen.getByText('Reset');
    
    // Increment first
    fireEvent.click(incrementButton);
    fireEvent.click(incrementButton);
    expect(screen.getByText('Count: 5')).toBeInTheDocument();
    
    // Then reset
    fireEvent.click(resetButton);
    expect(screen.getByText('Count: 3')).toBeInTheDocument();
  });

  test('renders all buttons', () => {
    render(<Counter />);
    expect(screen.getByText('Increment')).toBeInTheDocument();
    expect(screen.getByText('Decrement')).toBeInTheDocument();
    expect(screen.getByText('Reset')).toBeInTheDocument();
  });
});