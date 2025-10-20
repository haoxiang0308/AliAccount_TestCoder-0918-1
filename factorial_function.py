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
        TypeError: If n is not an integer
    """
    if not isinstance(n, int):
        raise TypeError("Input must be an integer")
    
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    
    if n == 0 or n == 1:
        return 1
    
    result = 1
    for i in range(2, n + 1):
        result *= i
    
    return result

def save_factorial_function_to_random_file():
    """
    Saves the factorial function to a randomly named Python file.
    """
    # Generate a random filename
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    filename = f"/workspace/{random_name}.py"
    
    # Content to write to the file
    content = '''def factorial(n):
    """
    Calculate the factorial of a number.
    
    Args:
        n (int): A non-negative integer
    
    Returns:
        int: The factorial of n
    
    Raises:
        ValueError: If n is negative
        TypeError: If n is not an integer
    """
    if not isinstance(n, int):
        raise TypeError("Input must be an integer")
    
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    
    if n == 0 or n == 1:
        return 1
    
    result = 1
    for i in range(2, n + 1):
        result *= i
    
    return result
'''
    
    # Write the content to the randomly named file
    with open(filename, 'w') as file:
        file.write(content)
    
    print(f"Factorial function saved to {filename}")
    return filename

# Example usage
if __name__ == "__main__":
    # Test the factorial function
    print(f"Factorial of 5: {factorial(5)}")
    
    # Save to random file
    random_file = save_factorial_function_to_random_file()