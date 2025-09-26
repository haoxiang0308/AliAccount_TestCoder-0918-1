import math

def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.

    Args:
        n (int): A non-negative integer.

    Returns:
        int: The factorial of n.

    Raises:
        ValueError: If n is negative.
    """
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    # Using the math.prod function for efficiency, equivalent to math.factorial(n)
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

# Example usage:
if __name__ == "__main__":
    try:
        number = 5
        print(f"The factorial of {number} is {factorial(number)}")
    except ValueError as e:
        print(e)
