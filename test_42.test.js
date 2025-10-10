import React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import MyComponent from './MyComponent';

test('renders MyComponent with default name', () => {
  render(<MyComponent />);
  const greetingElement = screen.getByText(/Hello, World!/i);
  expect(greetingElement).toBeInTheDocument();
});

test('renders MyComponent with custom name', () => {
  render(<MyComponent name="Alice" />);
  const greetingElement = screen.getByText(/Hello, Alice!/i);
  expect(greetingElement).toBeInTheDocument();
});