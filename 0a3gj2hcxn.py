#!/usr/bin/env python3
"""
A clean Python script that uses the Requests library to call a REST API
and then saves itself to a randomly named .py file.
"""

import requests
import json
import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def call_rest_api():
    """
    Call a REST API and return the response.
    Using JSONPlaceholder API for demonstration.
    """
    try:
        # Using a public test API
        url = "https://jsonplaceholder.typicode.com/posts/1"
        response = requests.get(url)
        
        # Raise an exception for bad status codes
        response.raise_for_status()
        
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error making API request: {e}")
        return None

def main():
    print("Calling REST API...")
    data = call_rest_api()
    
    if data:
        print("API Response:")
        print(json.dumps(data, indent=2))
        
        # Read the current script's content
        current_script_path = os.path.abspath(__file__)
        with open(current_script_path, 'r') as f:
            script_content = f.read()
        
        # Generate random filename
        random_filename = generate_random_filename()
        
        # Save the script content to the randomly named file
        with open(random_filename, 'w') as f:
            f.write(script_content)
        
        print(f"\nScript saved to: {random_filename}")
    else:
        print("Failed to retrieve data from API")

if __name__ == "__main__":
    main()