# This Ruby method calculates the factorial of a given number n.
# It uses the reduce method on a range from 1 to n.
def factorial(n)
  (1..n).reduce(1, :*)
end

# Example usage:
# puts factorial(5) # => 120