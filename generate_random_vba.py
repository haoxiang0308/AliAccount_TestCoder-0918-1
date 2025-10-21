import os
import random
import string
import shutil

def generate_random_vba_filename():
    """Generate a random .vba filename"""
    # Generate a random string of 10 characters
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_string}.vba"

def create_random_vba_file():
    """Create a randomly named .vba file with the macro content"""
    # Source file with the macro content
    source_file = "format_excel_macro.bas"
    
    # Generate random filename
    random_filename = generate_random_vba_filename()
    
    # Copy the macro content to the new random filename
    shutil.copy(source_file, random_filename)
    
    print(f"VBA macro saved to randomly named file: {random_filename}")
    return random_filename

if __name__ == "__main__":
    create_random_vba_file()