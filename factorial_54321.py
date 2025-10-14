def factorial(n):
  """
  Calculates the factorial of a non-negative integer n.

  Args:
      n: The non-negative integer to calculate the factorial for.

  Returns:
      The factorial of n (n!), or None if n is negative.
  """
  if n < 0:
    print("Factorial is not defined for negative numbers.")
    return None
  elif n == 0 or n == 1:
    return 1
  else:
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

# Example usage:
# number = 5
# result = factorial(number)
# print(f"The factorial of {number} is {result}")