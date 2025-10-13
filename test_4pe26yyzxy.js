const { expect } = require('chai');

// The function to be tested
function add(a, b) {
  return a + b;
}

describe('Addition Function', () => {
  it('should add two positive numbers correctly', () => {
    expect(add(2, 3)).to.equal(5);
  });

  it('should add a positive and a negative number correctly', () => {
    expect(add(5, -3)).to.equal(2);
  });
});