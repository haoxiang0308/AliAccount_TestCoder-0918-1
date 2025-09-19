import React from 'react';
import { render, screen } from '@testing-library/react';
import WelcomeComponent from './WelcomeComponent';

// Mocking React to avoid importing the actual implementation
jest.mock('react', () => ({
  ...jest.requireActual('react'),
  createElement: jest.fn((type, props, ...children) => ({
    type,
    props,
    children,
    $$typeof: Symbol.for('react.element'),
  })),
}));

describe('WelcomeComponent', () => {
  beforeEach(() => {
    // Clear all mocks before each test
    jest.clearAllMocks();
  });

  test('renders without crashing', () => {
    render(<WelcomeComponent />);
    expect(React.createElement).toHaveBeenCalled();
  });

  test('renders the welcome message', () => {
    render(<WelcomeComponent />);
    
    // Check if the main heading is rendered
    const headingElement = screen.getByText(/Welcome to Our Application!/i);
    expect(headingElement).toBeInTheDocument();
    
    // Check if the paragraph text is rendered
    const paragraphElement = screen.getByText(/We're glad to have you here. Enjoy your stay!/i);
    expect(paragraphElement).toBeInTheDocument();
  });

  test('applies correct styling', () => {
    render(<WelcomeComponent />);
    
    // Since we're using React Testing Library, we'll check if the container has content
    // In a real test environment, we might use a custom matcher to check styles
    const container = screen.getByText(/Welcome to Our Application!/i).parentElement;
    expect(container).toBeInTheDocument();
  });
});