import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import Button from './Button';

describe('Button Component', () => {
  test('renders button with correct text', () => {
    const buttonText = 'Click me';
    render(<Button>{buttonText}</Button>);
    
    const buttonElement = screen.getByText(buttonText);
    expect(buttonElement).toBeInTheDocument();
  });

  test('calls onClick when clicked', () => {
    const handleClick = jest.fn();
    render(<Button onClick={handleClick}>Click me</Button>);
    
    const buttonElement = screen.getByText('Click me');
    fireEvent.click(buttonElement);
    
    expect(handleClick).toHaveBeenCalledTimes(1);
  });

  test('is disabled when disabled prop is true', () => {
    render(<Button disabled>Click me</Button>);
    
    const buttonElement = screen.getByText('Click me');
    expect(buttonElement).toBeDisabled();
  });

  test('is not disabled when disabled prop is false', () => {
    render(<Button disabled={false}>Click me</Button>);
    
    const buttonElement = screen.getByText('Click me');
    expect(buttonElement).not.toBeDisabled();
  });
});