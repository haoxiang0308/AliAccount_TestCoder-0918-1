import random
import string

def factorial(n):
    """
    Calculate the factorial of a number.
    
    Args:
        n (int): A non-negative integer
        
    Returns:
        int: The factorial of n
        
    Raises:
        ValueError: If n is negative
    """
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    
    if n == 0 or n == 1:
        return 1
    
    result = 1
    for i in range(2, n + 1):
        result *= i
    
    return result

def generate_random_filename():
    """Generate a random Python filename."""
    random_name = ''.join(random.choices(string.ascii_lowercase, k=8))
    return f"{random_name}.py"

# Example usage
if __name__ == "__main__":
    # Generate a random filename
    filename = generate_random_filename()
    print(f"Random filename: {filename}")
    
    # Test the factorial function
    test_number = 5
    result = factorial(test_number)
    print(f"Factorial of {test_number} is {result}")