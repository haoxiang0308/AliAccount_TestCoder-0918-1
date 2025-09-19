import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import Counter from './Counter';

// Mock the React useState hook
jest.mock('react', () => ({
  ...jest.requireActual('react'),
  useState: jest.fn(),
}));

describe('Counter Component', () => {
  let setCountMock;

  beforeEach(() => {
    setCountMock = jest.fn();
    // Mocking useState to return a fixed count value and our setCount mock
    React.useState = jest.fn().mockImplementation((initialValue) => [initialValue, setCountMock]);
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  test('renders with initial count', () => {
    React.useState.mockImplementation(() => [5, setCountMock]);
    
    render(<Counter initialCount={5} />);
    
    expect(screen.getByText('Counter: 5')).toBeInTheDocument();
  });

  test('increments count when + button is clicked', () => {
    React.useState.mockImplementation(() => [3, setCountMock]);
    
    render(<Counter initialCount={3} />);
    
    const incrementButton = screen.getByText('+');
    fireEvent.click(incrementButton);
    
    expect(setCountMock).toHaveBeenCalledWith(4);
  });

  test('decrements count when - button is clicked', () => {
    React.useState.mockImplementation(() => [7, setCountMock]);
    
    render(<Counter initialCount={7} />);
    
    const decrementButton = screen.getByText('-');
    fireEvent.click(decrementButton);
    
    expect(setCountMock).toHaveBeenCalledWith(6);
  });

  test('resets count when Reset button is clicked', () => {
    React.useState.mockImplementation(() => [10, setCountMock]);
    
    render(<Counter initialCount={5} />);
    
    const resetButton = screen.getByText('Reset');
    fireEvent.click(resetButton);
    
    expect(setCountMock).toHaveBeenCalledWith(5);
  });
});