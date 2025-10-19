#!/usr/bin/env python3
# Python script to get list of processes and save to a file with random name

import subprocess
import json
import random
import string
import os

def generate_random_filename(extension="txt"):
    """Generate a random filename without extension"""
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_name}.{extension}"

try:
    # Using 'ps' command to get process list on Linux
    result = subprocess.run(['ps', 'aux'], capture_output=True, text=True, check=True)
    processes = result.stdout
    
    # Generate random filename
    filename = generate_random_filename("txt")
    
    # Write processes to the file
    with open(filename, 'w') as f:
        f.write(processes)
    
    print(f"Process list saved to {filename}")
    
except subprocess.CalledProcessError as e:
    print(f"Error occurred while getting process list: {e}")
except FileNotFoundError:
    # If 'ps' is not available, try 'top' command with batch mode
    try:
        result = subprocess.run(['top', '-b', '-n', '1'], capture_output=True, text=True, check=True)
        processes = result.stdout
        
        # Generate random filename
        filename = generate_random_filename("txt")
        
        # Write processes to the file
        with open(filename, 'w') as f:
            f.write(processes)
        
        print(f"Process list saved to {filename}")
    except (subprocess.CalledProcessError, FileNotFoundError) as e:
        print(f"Could not retrieve process list: {e}")