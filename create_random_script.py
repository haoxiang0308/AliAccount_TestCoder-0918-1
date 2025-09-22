import os
import random
import string
import shutil

def generate_random_filename(length=8):
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(length))
    return f"{random_name}.py"

def main():
    # Source file (the MySQL script we created)
    source_file = "/workspace/mysql_query_script.py"
    
    # Generate a random filename
    random_filename = generate_random_filename()
    destination_file = f"/workspace/{random_filename}"
    
    # Copy the file with the new random name
    try:
        shutil.copy2(source_file, destination_file)
        print(f"Successfully created {destination_file} with the MySQL query script.")
        print(f"Random filename generated: {random_filename}")
    except Exception as e:
        print(f"Error copying file: {e}")

if __name__ == "__main__":
    main()