import React from 'react';
import { render, screen } from '@testing-library/react';
import Button from './Button'; // Adjust the import path as needed

describe('Button Component', () => {
  test('renders button with correct text', () => {
    const buttonText = 'Click Me';
    render(<Button>{buttonText}</Button>);

    const buttonElement = screen.getByText(buttonText);
    expect(buttonElement).toBeInTheDocument();
  });

  test('applies the correct CSS class when variant is primary', () => {
    const { container } = render(<Button variant="primary">Click Me</Button>);

    const buttonElement = container.firstChild;
    expect(buttonElement).toHaveClass('btn-primary');
  });

  test('applies the correct CSS class when variant is secondary', () => {
    const { container } = render(<Button variant="secondary">Click Me</Button>);

    const buttonElement = container.firstChild;
    expect(buttonElement).toHaveClass('btn-secondary');
  });

  test('is disabled when disabled prop is true', () => {
    render(<Button disabled>Click Me</Button>);

    const buttonElement = screen.getByRole('button');
    expect(buttonElement).toBeDisabled();
  });
});