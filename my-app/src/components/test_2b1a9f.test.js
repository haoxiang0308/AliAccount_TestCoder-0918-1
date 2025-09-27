import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import Welcome from './Welcome';

describe('Welcome Component', () => {
  test('renders with default name', () => {
    render(<Welcome />);
    expect(screen.getByText(/Hello, World!/i)).toBeInTheDocument();
  });

  test('renders with custom name', () => {
    render(<Welcome name="Alice" />);
    expect(screen.getByText(/Hello, Alice!/i)).toBeInTheDocument();
  });
});