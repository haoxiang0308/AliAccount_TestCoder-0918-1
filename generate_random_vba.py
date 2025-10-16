import os
import random
import string
from shutil import copy2

def generate_random_vba_filename():
    """Generate a random .vba filename"""
    # Generate a random string of 10 characters
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_string}.vba"

def main():
    # Source VBA file
    source_file = "format_excel_macro.vba"
    
    # Generate random filename
    random_filename = generate_random_vba_filename()
    
    # Copy the source file to the randomly named file
    copy2(source_file, random_filename)
    
    print(f"VBA macro saved to randomly named file: {random_filename}")
    return random_filename

if __name__ == "__main__":
    main()