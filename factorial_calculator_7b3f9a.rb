# Ruby method to calculate factorial of a number
def factorial(n)
  # Handle edge cases
  return 1 if n == 0 || n == 1
  
  # Calculate factorial iteratively
  result = 1
  (2..n).each do |i|
    result *= i
  end
  
  result
end

# Example usage:
# puts factorial(5) # => 120
# puts factorial(0) # => 1