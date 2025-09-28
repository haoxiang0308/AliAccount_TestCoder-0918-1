import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders correctly with name prop', () => {
    render(<MyComponent name="Alice" />);
    expect(screen.getByText(/Hello, Alice!/i)).toBeInTheDocument();
  });

  test('renders correctly with different name prop', () => {
    render(<MyComponent name="Bob" />);
    expect(screen.getByText(/Hello, Bob!/i)).toBeInTheDocument();
  });
});