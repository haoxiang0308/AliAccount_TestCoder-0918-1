import random
import string

def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.
    
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
    Save the factorial function to a randomly named Python file.
    
    Returns:
        str: The name of the file where the function was saved
    """
    # Generate a random filename
    random_filename = 'factorial_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'
    
    # Content to save in the file
    content = '''def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.
    
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
    
    # Write the content to the random file
    with open(random_filename, 'w') as file:
        file.write(content)
    
    return random_filename

# Example usage
if __name__ == "__main__":
    # Test the factorial function
    print(f"5! = {factorial(5)}")
    print(f"0! = {factorial(0)}")
    
    # Save to a random file
    filename = save_factorial_function_to_random_file()
    print(f"Factorial function saved to: {filename}")