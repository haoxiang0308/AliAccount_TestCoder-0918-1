import { render, screen } from '@testing-library/react';
import SimpleComponent from './SimpleComponent';

describe('SimpleComponent', () => {
  test('renders with default name', () => {
    render(<SimpleComponent />);
    expect(screen.getByText(/Hello, World!/i)).toBeInTheDocument();
  });

  test('renders with custom name', () => {
    render(<SimpleComponent name="Alice" />);
    expect(screen.getByText(/Hello, Alice!/i)).toBeInTheDocument();
  });
});