import os
import random
import string
from datetime import datetime

def create_random_vba_file():
    # Read the original macro content
    with open('/workspace/format_excel_macro.bas', 'r') as f:
        macro_content = f.read()
    
    # Generate a random filename with .vba extension
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    random_filename = f"macro_{random_name}_{timestamp}.vba"
    
    # Write the macro content to the randomly named file
    random_filepath = f"/workspace/{random_filename}"
    with open(random_filepath, 'w') as f:
        f.write(macro_content)
    
    print(f"VBA macro saved to: {random_filepath}")
    return random_filepath

if __name__ == "__main__":
    create_random_vba_file()