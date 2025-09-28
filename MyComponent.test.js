import React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import MyComponent from './MyComponent'; // Adjust the import path as needed

describe('MyComponent', () => {
  test('renders a welcome message', () => {
    const testMessage = 'Welcome to MyComponent!';
    render(<MyComponent message={testMessage} />);
    const messageElement = screen.getByText(/welcome to mycomponent!/i);
    expect(messageElement).toBeInTheDocument();
  });

  test('matches snapshot', () => {
    const { container } = render(<MyComponent message="Snapshot Test" />);
    expect(container).toMatchSnapshot();
  });
});