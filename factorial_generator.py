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

def save_factorial_function():
    """
    Save the factorial function to a randomly named Python file.
    
    Returns:
        str: The name of the file where the function was saved
    """
    # Generate a random filename
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    filename = f"{random_name}.py"
    
    # Create the content to save
    content = '''def factorial(n):
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

# Example usage:
# print(factorial(5))  # Output: 120
'''
    
    # Write the content to the file
    with open(filename, 'w') as file:
        file.write(content)
    
    print(f"Factorial function saved to {filename}")
    return filename

# Generate and save the function
if __name__ == "__main__":
    saved_file = save_factorial_function()
    print(f"Function saved successfully to: {saved_file}")