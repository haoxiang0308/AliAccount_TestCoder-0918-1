import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import Counter from './Counter';

// Additional tests with different edge cases
describe('Counter Component - Edge Cases', () => {
  test('works with negative initial count', () => {
    render(<Counter initialCount={-5} />);
    expect(screen.getByText('Count: -5')).toBeInTheDocument();
  });

  test('handles multiple rapid clicks', () => {
    render(<Counter />);
    const incrementButton = screen.getByText('Increment');
    
    // Click 5 times quickly
    fireEvent.click(incrementButton);
    fireEvent.click(incrementButton);
    fireEvent.click(incrementButton);
    fireEvent.click(incrementButton);
    fireEvent.click(incrementButton);
    
    expect(screen.getByText('Count: 5')).toBeInTheDocument();
  });

  test('maintains state independently for multiple instances', () => {
    render(
      <>
        <Counter initialCount={1} />
        <Counter initialCount={10} />
      </>
    );
    
    const counters = screen.getAllByText(/Count: /);
    expect(counters[0]).toHaveTextContent('Count: 1');
    expect(counters[1]).toHaveTextContent('Count: 10');
  });
});