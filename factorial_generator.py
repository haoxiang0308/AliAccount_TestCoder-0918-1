import random
import string
import os

def factorial(n):
    """
    Calculate the factorial of a number.
    
    Args:
        n (int): A non-negative integer
        
    Returns:
        int: The factorial of n
    """
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

def save_factorial_function():
    """
    Save the factorial function to a randomly named Python file.
    
    Returns:
        str: The name of the file where the function was saved
    """
    # Generate a random filename
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    filename = f"{random_name}.py"
    
    # Create the content for the file
    content = '''def factorial(n):
    """
    Calculate the factorial of a number.
    
    Args:
        n (int): A non-negative integer
        
    Returns:
        int: The factorial of n
    """
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result
'''
    
    # Write the content to the file
    with open(filename, 'w') as f:
        f.write(content)
    
    print(f"Factorial function saved to {filename}")
    return filename

# Example usage
if __name__ == "__main__":
    # Save the factorial function to a random file
    saved_file = save_factorial_function()
    
    # Test the function
    print(f"Factorial of 5: {factorial(5)}")
    print(f"Factorial of 0: {factorial(0)}")
    print(f"Factorial of 1: {factorial(1)}")