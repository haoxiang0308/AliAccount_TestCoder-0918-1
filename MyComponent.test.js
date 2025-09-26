import React from 'react';
import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent'; // Adjust the import path as needed

describe('MyComponent', () => {
  test('renders without crashing', () => {
    render(<MyComponent />);
    // Example assertion - adjust based on your component's expected output
    expect(screen.getByText(/hello/i)).toBeInTheDocument();
  });

  test('matches snapshot', () => {
    const { asFragment } = render(<MyComponent />);
    expect(asFragment()).toMatchSnapshot();
  });
});