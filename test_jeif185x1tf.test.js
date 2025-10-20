import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import '@testing-library/jest-dom';
import ButtonComponent from './ButtonComponent';

describe('ButtonComponent', () => {
  test('renders button with correct label', () => {
    const label = 'Click me';
    render(<ButtonComponent label={label} />);
    
    expect(screen.getByText(label)).toBeInTheDocument();
  });

  test('calls onClick handler when clicked', () => {
    const mockOnClick = jest.fn();
    render(<ButtonComponent label="Test Button" onClick={mockOnClick} />);
    
    const button = screen.getByRole('button', { name: /test button/i });
    fireEvent.click(button);
    
    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });

  test('is disabled when disabled prop is true', () => {
    render(<ButtonComponent label="Disabled Button" disabled={true} />);
    
    const button = screen.getByRole('button', { name: /disabled button/i });
    expect(button).toBeDisabled();
  });

  test('is enabled when disabled prop is false', () => {
    render(<ButtonComponent label="Enabled Button" disabled={false} />);
    
    const button = screen.getByRole('button', { name: /enabled button/i });
    expect(button).not.toBeDisabled();
  });

  test('matches snapshot', () => {
    const { container } = render(<ButtonComponent label="Snapshot Test" />);
    expect(container).toMatchSnapshot();
  });
});