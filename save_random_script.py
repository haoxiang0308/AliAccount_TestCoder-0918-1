import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def save_api_script_to_random_file():
    """Read the API script and save it to a randomly named file"""
    # Read the content of the API script
    with open('/workspace/api_script.py', 'r') as source_file:
        api_script_content = source_file.read()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    random_file_path = f"/workspace/{random_filename}"
    
    # Write the content to the random filename
    with open(random_file_path, 'w') as target_file:
        target_file.write(api_script_content)
    
    print(f"API script saved to: {random_file_path}")
    return random_file_path

if __name__ == "__main__":
    save_api_script_to_random_file()