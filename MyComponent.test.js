import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders the name prop', () => {
    render(<MyComponent name="Alice" />);
    expect(screen.getByText(/Hello, Alice!/i)).toBeInTheDocument();
  });

  test('renders a list of items', () => {
    const items = ['Apple', 'Banana', 'Cherry'];
    render(<MyComponent name="Bob" items={items} />);
    items.forEach(item => {
      expect(screen.getByText(item)).toBeInTheDocument();
    });
  });

  test('renders an empty list if no items are provided', () => {
    render(<MyComponent name="Charlie" />);
    // Check if the list element is rendered but is empty
    const listElement = screen.getByRole('list'); // Assuming the ul has a role of 'list' or we find it by other means
    expect(listElement).toBeInTheDocument();
    expect(listElement.querySelectorAll('li')).toHaveLength(0);
  });
});