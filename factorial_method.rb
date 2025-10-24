# Method to calculate factorial of a number
def factorial(n)
  # Handle edge cases
  return 1 if n == 0 || n == 1
  return nil if n < 0  # Factorial is not defined for negative numbers
  
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
# puts factorial(1)  # Output: 1