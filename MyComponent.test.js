import React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders the name prop', () => {
    render(<MyComponent name="Test User" />);
    expect(screen.getByText(/Hello, Test User!/i)).toBeInTheDocument();
  });

  test('renders list items when items prop is provided', () => {
    const items = ['Item 1', 'Item 2', 'Item 3'];
    render(<MyComponent name="Test User" items={items} />);
    
    items.forEach(item => {
      expect(screen.getByText(item)).toBeInTheDocument();
    });
  });

  test('renders without list items when no items prop is provided', () => {
    render(<MyComponent name="Test User" />);
    const listItems = screen.queryAllByRole('listitem');
    expect(listItems).toHaveLength(0);
  });
});