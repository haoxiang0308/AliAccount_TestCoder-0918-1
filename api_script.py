#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API
and display the response.
"""

import requests
import json
import random
import string

def call_rest_api():
    """
    Function to call a REST API and return the response
    """
    # Using JSONPlaceholder API as an example REST API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make a GET request to the API
        response = requests.get(url)
        
        # Check if the request was successful
        if response.status_code == 200:
            print(f"API call successful! Status code: {response.status_code}")
            
            # Parse the JSON response
            data = response.json()
            
            print("Response data:")
            print(json.dumps(data, indent=2))
            
            return data
        else:
            print(f"API call failed! Status code: {response.status_code}")
            return None
            
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while calling the API: {e}")
        return None

def generate_random_filename():
    """
    Generate a random filename with .py extension
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

if __name__ == "__main__":
    print("Calling REST API...")
    api_data = call_rest_api()
    
    if api_data:
        # Generate a random filename
        random_filename = generate_random_filename()
        print(f"\nSaving API response to random file: {random_filename}")
        
        # Write the API response to the randomly named file
        with open(random_filename, 'w') as f:
            f.write("# API Response Data\n")
            f.write("api_response = ")
            f.write(json.dumps(api_data, indent=2))
            f.write("\n")
        
        print(f"Successfully saved API response to {random_filename}")
    else:
        print("Failed to get API response, no file created.")