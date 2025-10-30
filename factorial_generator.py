import random
import string

def generate_random_filename():
    """Generate a random Python filename"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"{random_name}.py"

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
    """Save the factorial function to a randomly named Python file"""
    random_filename = generate_random_filename()
    filepath = f"/workspace/{random_filename}"
    
    function_code = '''def factorial(n):
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
    
    return result'''

    with open(filepath, 'w') as file:
        file.write(function_code)
    
    print(f"Factorial function saved to {random_filename}")
    return filepath

# Generate and save the function
if __name__ == "__main__":
    save_factorial_function()