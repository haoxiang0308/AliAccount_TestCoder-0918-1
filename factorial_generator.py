import random
import string
import os

def factorial(n):
    """
    Calculate the factorial of a given number n.
    
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

def save_factorial_function_to_random_file():
    """
    Saves the factorial function to a randomly named Python file.
    
    Returns:
        str: The name of the file where the function was saved
    """
    # Generate a random filename
    random_filename = 'factorial_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'
    
    # Create the content for the file
    file_content = '''def factorial(n):
    """
    Calculate the factorial of a given number n.
    
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
'''
    
    # Write the function to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(file_content)
    
    print(f"Factorial function saved to: {random_filename}")
    return random_filename

# Example usage
if __name__ == "__main__":
    # Save the function to a random file
    filename = save_factorial_function_to_random_file()
    
    # Test the function by importing and using it
    import importlib.util
    spec = importlib.util.spec_from_file_location("factorial_module", filename)
    factorial_module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(factorial_module)
    
    # Test the imported function
    test_values = [0, 1, 5, 10]
    print("Testing the saved factorial function:")
    for val in test_values:
        result = factorial_module.factorial(val)
        print(f"factorial({val}) = {result}")