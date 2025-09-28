// This is a generated test file.
import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import MyButton from './MyButton';

describe('MyButton Component', () => {
  test('renders correctly with given label', () => {
    const label = 'Click Me';
    render(<MyButton label={label} />);
    expect(screen.getByText(label)).toBeInTheDocument();
  });

  test('calls onClick handler when clicked', async () => {
    const user = userEvent.setup();
    const mockOnClick = jest.fn();
    render(<MyButton label="Test Button" onClick={mockOnClick} />);
    const button = screen.getByRole('button');
    await user.click(button);
    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });

  test('is disabled when disabled prop is true', () => {
    render(<MyButton label="Disabled Button" disabled={true} />);
    const button = screen.getByRole('button');
    expect(button).toBeDisabled();
  });
});