import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import Button from './Button';

describe('Button Component', () => {
  test('renders button with correct text', () => {
    render(&lt;Button&gt;Click Me&lt;/Button&gt;);
    const buttonElement = screen.getByText(/click me/i);
    expect(buttonElement).toBeInTheDocument();
  });

  test('calls onClick when clicked', () =&gt; {
    const handleClick = jest.fn();
    render(&lt;Button onClick={handleClick}&gt;Click Me&lt;/Button&gt;);
    const buttonElement = screen.getByText(/click me/i);
    
    fireEvent.click(buttonElement);
    expect(handleClick).toHaveBeenCalledTimes(1);
  });

  test('is disabled when disabled prop is true', () =&gt; {
    render(&lt;Button disabled&gt;Click Me&lt;/Button&gt;);
    const buttonElement = screen.getByText(/click me/i);
    expect(buttonElement).toBeDisabled();
  });
});