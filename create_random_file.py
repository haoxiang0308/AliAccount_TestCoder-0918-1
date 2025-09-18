import random
import string
import os
import shutil

def generate_random_filename(length=10):
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(length))
    return f"{random_name}.py"

def main():
    # Generate a random filename
    random_filename = generate_random_filename()
    target_path = f"/workspace/{random_filename}"
    
    # Copy the mongo script to the new randomly named file
    source_path = "/workspace/mongo_insert_script.py"
    shutil.copy(source_path, target_path)
    
    print(f"Script copied to randomly named file: {random_filename}")
    print(f"Full path: {target_path}")

if __name__ == "__main__":
    main()