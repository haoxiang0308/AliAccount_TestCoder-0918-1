import { render, screen, fireEvent } from '@testing-library/react';
import MyButton from './MyButton';

describe('MyButton', () => {
  test('renders the button with the correct label', () => {
    const label = 'Click Me';
    render(<MyButton label={label} />);
    expect(screen.getByText(label)).toBeInTheDocument();
  });

  test('calls onClick when clicked', () => {
    const mockOnClick = jest.fn();
    render(<MyButton label="Test Button" onClick={mockOnClick} />);
    fireEvent.click(screen.getByText('Test Button'));
    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });

  test('is disabled when disabled prop is true', () => {
    render(<MyButton label="Disabled Button" disabled={true} />);
    expect(screen.getByText('Disabled Button')).toBeDisabled();
  });
});