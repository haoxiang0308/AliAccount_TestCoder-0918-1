import React from 'react';
import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders name and age correctly', () => {
    const name = 'John';
    const age = 25;

    render(<MyComponent name={name} age={age} />);

    expect(screen.getByText(`Hello, ${name}!`)).toBeInTheDocument();
    expect(screen.getByText(`You are ${age} years old.`)).toBeInTheDocument();
  });

  test('renders different name and age correctly', () => {
    const name = 'Jane';
    const age = 30;

    render(<MyComponent name={name} age={age} />);

    expect(screen.getByText(`Hello, ${name}!`)).toBeInTheDocument();
    expect(screen.getByText(`You are ${age} years old.`)).toBeInTheDocument();
  });

  test('handles empty name', () => {
    const name = '';
    const age = 20;

    render(<MyComponent name={name} age={age} />);

    expect(screen.getByText('Hello, !')).toBeInTheDocument();
    expect(screen.getByText(`You are ${age} years old.`)).toBeInTheDocument();
  });
});