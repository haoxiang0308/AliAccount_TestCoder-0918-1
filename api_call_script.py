#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API.
This script fetches data from a public API and displays the results.
"""

import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def call_rest_api():
    """
    Call a REST API and return the response.
    Using JSONPlaceholder API as an example.
    """
    try:
        # Using a public API for demonstration
        url = "https://jsonplaceholder.typicode.com/posts/1"
        response = requests.get(url)
        
        # Raise an exception for bad status codes
        response.raise_for_status()
        
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error making API request: {e}")
        return None

def save_to_random_file(content):
    """Save content to a randomly named .py file."""
    filename = generate_random_filename()
    
    with open(filename, 'w') as file:
        file.write(content)
    
    print(f"Content saved to {filename}")
    return filename

if __name__ == "__main__":
    print("Calling REST API...")
    api_data = call_rest_api()
    
    if api_data:
        print("API call successful!")
        print("Data received:", json.dumps(api_data, indent=2))
        
        # Create a Python script with the API data
        script_content = f'''#!/usr/bin/env python3
\"\"\"
Python script with API data
Generated on: {generate_random_filename()}
\"\"\"

import json

# Data retrieved from API
api_data = {json.dumps(api_data, indent=4)}

def display_api_data():
    print("API Data:")
    print(json.dumps(api_data, indent=2))

if __name__ == "__main__":
    display_api_data()
'''
        
        # Save to a randomly named file
        random_filename = save_to_random_file(script_content)
        print(f"Created new Python script: {random_filename}")
    else:
        print("Failed to retrieve data from API")