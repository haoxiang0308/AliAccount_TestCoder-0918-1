import random
import string

def generate_random_filename(ext="py", length=10):
    """Generates a random filename with a given extension."""
    letters = string.ascii_lowercase
    random_part = ''.join(random.choice(letters) for i in range(length))
    return f"{random_part}.{ext}"

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
        raise TypeError("Input must be an integer.")
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

if __name__ == "__main__":
    # Example usage
    num = 5
    print(f"The factorial of {num} is {factorial(num)}")
    
    # Generate a random filename and save the function
    random_filename = generate_random_filename()
    with open(random_filename, 'w') as f:
        f.write('# Factorial Function\n\n')
        f.write('def factorial(n):\n')
        f.write('    """\n')
        f.write('    Calculate the factorial of a non-negative integer n.\n')
        f.write('    \n')
        f.write('    Args:\n')
        f.write('        n (int): A non-negative integer\n')
        f.write('        \n')
        f.write('    Returns:\n')
        f.write('        int: The factorial of n\n')
        f.write('        \n')
        f.write('    Raises:\n')
        f.write('        ValueError: If n is negative\n')
        f.write('        TypeError: If n is not an integer\n')
        f.write('    """\n')
        f.write('    if not isinstance(n, int):\n')
        f.write('        raise TypeError("Input must be an integer.")\n')
        f.write('    if n < 0:\n')
        f.write('        raise ValueError("Factorial is not defined for negative numbers.")\n')
        f.write('    \n')
        f.write('    if n == 0 or n == 1:\n')
        f.write('        return 1\n')
        f.write('    result = 1\n')
        f.write('    for i in range(2, n + 1):\n')
        f.write('        result *= i\n')
        f.write('    return result\n')
    
    print(f"Factorial function saved to {random_filename}")
