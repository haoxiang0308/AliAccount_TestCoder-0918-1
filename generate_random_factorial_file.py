import random
import string
import os

def generate_random_filename():
    """Generate a random Python filename."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
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

# Generate a random filename
random_filename = generate_random_filename()

# Write the factorial function to the randomly named file
with open(random_filename, 'w') as file:
    file.write(f"def factorial(n):\n")
    file.write(f'    """\n')
    file.write(f'    Calculate the factorial of a number.\n')
    file.write(f'    \n')
    file.write(f'    Args:\n')
    file.write(f'        n (int): A non-negative integer\n')
    file.write(f'    \n')
    file.write(f'    Returns:\n')
    file.write(f'        int: The factorial of n\n')
    file.write(f'    \n')
    file.write(f'    Raises:\n')
    file.write(f'        ValueError: If n is negative\n')
    file.write(f'        TypeError: If n is not an integer\n')
    file.write(f'    """\n')
    file.write(f'    if not isinstance(n, int):\n')
    file.write(f'        raise TypeError("Input must be an integer")\n')
    file.write(f'    \n')
    file.write(f'    if n < 0:\n')
    file.write(f'        raise ValueError("Factorial is not defined for negative numbers")\n')
    file.write(f'    \n')
    file.write(f'    if n == 0 or n == 1:\n')
    file.write(f'        return 1\n')
    file.write(f'    \n')
    file.write(f'    result = 1\n')
    file.write(f'    for i in range(2, n + 1):\n')
    file.write(f'        result *= i\n')
    file.write(f'    \n')
    file.write(f'    return result\n')
    file.write(f'\n\n# Example usage\n')
    file.write(f'if __name__ == "__main__":\n')
    file.write(f'    print(f"Factorial of 5: {{factorial(5)}}")\n')
    file.write(f'    print(f"Factorial of 0: {{factorial(0)}}")\n')
    file.write(f'    print(f"Factorial of 10: {{factorial(10)}}")\n')

print(f"Factorial function saved to: {random_filename}")