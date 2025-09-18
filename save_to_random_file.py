import random
import string
import shutil
import os

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
    source_path = "/workspace/final_mongo_script.py"
    shutil.copy(source_path, target_path)
    
    print(f"Script saved to randomly named file: {random_filename}")
    print(f"Full path: {target_path}")
    
    # Also display the content of the file
    print("\nContent of the script:")
    print("=" * 50)
    with open(target_path, 'r') as f:
        print(f.read())
    print("=" * 50)

if __name__ == "__main__":
    main()