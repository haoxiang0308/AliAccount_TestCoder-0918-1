import React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders title and description correctly', () => {
    const title = 'Test Title';
    const description = 'Test Description';
    
    render(<MyComponent title={title} description={description} />);
    
    expect(screen.getByText(title)).toBeInTheDocument();
    expect(screen.getByText(description)).toBeInTheDocument();
  });

  test('renders different content when props change', () => {
    const title = 'Another Title';
    const description = 'Another Description';
    
    render(<MyComponent title={title} description={description} />);
    
    expect(screen.getByText(title)).toBeInTheDocument();
    expect(screen.getByText(description)).toBeInTheDocument();
  });

  test('handles empty props gracefully', () => {
    render(<MyComponent title="" description="" />);
    
    // Should render empty h1 and p elements
    const h1Element = screen.getByRole('heading', { level: 1 });
    const pElement = screen.getByText('');
    
    expect(h1Element).toBeInTheDocument();
    expect(pElement).toBeInTheDocument();
  });
});