import random
import string
import os
import shutil

def generate_random_vba():
    # Read the original macro file
    with open('/workspace/format_excel_macro.bas', 'r') as f:
        macro_content = f.read()
    
    # Generate a random filename with .vba extension
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.vba'
    random_path = f'/workspace/{random_name}'
    
    # Write the macro content to the randomly named .vba file
    with open(random_path, 'w') as f:
        f.write(macro_content)
    
    print(f"VBA macro saved to randomly named file: {random_path}")
    return random_path

if __name__ == "__main__":
    generate_random_vba()