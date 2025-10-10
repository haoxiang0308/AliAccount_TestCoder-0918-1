import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import '@testing-library/jest-dom';
import MyButton from './MyButton';

describe('MyButton Component', () => {
  it('renders correctly with children', () => {
    render(<MyButton>Click Me</MyButton>);
    expect(screen.getByText('Click Me')).toBeInTheDocument();
  });

  it('calls the onClick handler when clicked', () => {
    const mockOnClick = jest.fn();
    render(<MyButton onClick={mockOnClick}>Click Me</MyButton>);
    fireEvent.click(screen.getByText('Click Me'));
    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });

  it('is disabled when the disabled prop is true', () => {
    render(<MyButton disabled>Click Me</MyButton>);
    expect(screen.getByText('Click Me')).toBeDisabled();
  });
});