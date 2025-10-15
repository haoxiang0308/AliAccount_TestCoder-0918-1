const { add } = require('./addFunction');

describe('Add Function', function() {
  it('should add two positive numbers correctly', function() {
    const result = add(2, 3);
    expect(result).to.equal(5);
  });

  it('should add two negative numbers correctly', function() {
    const result = add(-2, -3);
    expect(result).to.equal(-5);
  });

  it('should add a positive and a negative number correctly', function() {
    const result = add(5, -3);
    expect(result).to.equal(2);
  });

  it('should add zero to a number correctly', function() {
    const result = add(7, 0);
    expect(result).to.equal(7);
  });

  it('should handle decimal numbers correctly', function() {
    const result = add(2.5, 3.7);
    expect(result).to.equal(6.2);
  });
});