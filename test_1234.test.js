import React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import MyComponent from './MyComponent';

test('renders component with correct name', () => {
  render(<MyComponent name="Alice" />);
  expect(screen.getByText(/Hello, Alice!/i)).toBeInTheDocument();
});