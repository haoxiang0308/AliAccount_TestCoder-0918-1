# Method to calculate factorial of a number
def factorial(n)
  # Check if the input is non-negative
  if n < 0
    raise ArgumentError, "Factorial is not defined for negative numbers"
  end
  
  # Base cases: 0! = 1 and 1! = 1
  return 1 if n == 0 || n == 1
  
  # Calculate factorial iteratively
  result = 1
  (2..n).each do |i|
    result *= i
  end
  
  result
end

# Example usage:
# puts factorial(5)  # Output: 120
# puts factorial(0)  # Output: 1