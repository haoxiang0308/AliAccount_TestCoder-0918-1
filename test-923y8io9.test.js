import React from 'react';
import { render, screen } from '@testing-library/react';
import SampleComponent from './SampleComponent';

describe('SampleComponent', () => {
  test('renders title and description correctly', () => {
    const title = 'Test Title';
    const description = 'Test Description';
    
    render(<SampleComponent title={title} description={description} />);
    
    expect(screen.getByText(title)).toBeInTheDocument();
    expect(screen.getByText(description)).toBeInTheDocument();
  });

  test('renders without crashing with empty props', () => {
    render(<SampleComponent />);
    
    // Check that the component renders without crashing
    expect(screen.getByRole('generic', { className: 'sample-component' })).toBeInTheDocument();
  });

  test('displays correct heading level', () => {
    const title = 'My Heading';
    
    render(<SampleComponent title={title} description="Some description" />);
    
    const heading = screen.getByText(title);
    expect(heading.tagName).toBe('H1');
  });
});