import random
import string


def generate_random_filename(extension='.py'):
    """Generates a random filename with the given extension."""
    letters_and_digits = string.ascii_letters + string.digits
    random_string = ''.join(random.choice(letters_and_digits) for _ in range(10))
    return random_string + extension


def factorial(n):
    """
    Calculates the factorial of a non-negative integer n.

    Args:
        n (int): A non-negative integer.

    Returns:
        int: The factorial of n.

    Raises:
        ValueError: If n is negative.
        TypeError: If n is not an integer.
    """
    if not isinstance(n, int):
        raise TypeError("Input must be an integer.")
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")

    if n == 0 or n == 1:
        return 1
    else:
        return n * factorial(n - 1)


if __name__ == "__main__":
    # Example usage
    try:
        number = 5
        result = factorial(number)
        print(f"The factorial of {number} is {result}")
    except (ValueError, TypeError) as e:
        print(f"Error: {e}")
