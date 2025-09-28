// Basic Jest test structure for a React component
import React from 'react';
import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

test('renders component with default name', () => {
  render(<MyComponent />);
  const element = screen.getByText(/Hello, World!/i);
  expect(element).toBeInTheDocument();
});

test('renders component with custom name', () => {
  render(<MyComponent name="Alice" />);
  const element = screen.getByText(/Hello, Alice!/i);
  expect(element).toBeInTheDocument();
});