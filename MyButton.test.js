import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import MyButton from './MyButton';

describe('MyButton', () => {
  it('renders the label correctly', () => {
    const label = 'Click Me';
    render(<MyButton label={label} />);
    expect(screen.getByText(label)).toBeInTheDocument();
  });

  it('calls the onClick handler when clicked', async () => {
    const user = userEvent.setup();
    const mockOnClick = jest.fn();
    render(<MyButton label="Test Button" onClick={mockOnClick} />);
    const button = screen.getByRole('button', { name: /test button/i });
    await user.click(button);
    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });

  it('is disabled when the disabled prop is true', () => {
    render(<MyButton label="Disabled Button" disabled={true} />);
    const button = screen.getByRole('button', { name: /disabled button/i });
    expect(button).toBeDisabled();
  });
});