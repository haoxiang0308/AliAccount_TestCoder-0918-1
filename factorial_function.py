import random
import string

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
    Saves the factorial function code to a randomly named Python file.
    
    Returns:
        str: The name of the randomly generated file
    """
    # Generate a random file name
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    random_filename = f"/workspace/{random_name}.py"
    
    # The function code as a string
    function_code = '''def factorial(n):
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
    return result'''

    # Write the function code to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(function_code)
    
    print(f"Factorial function saved to: {random_filename}")
    return random_filename

# Example usage
if __name__ == "__main__":
    # Test the factorial function
    print(f"Factorial of 5: {factorial(5)}")
    
    # Save the function to a random file
    random_file = save_factorial_function_to_random_file()