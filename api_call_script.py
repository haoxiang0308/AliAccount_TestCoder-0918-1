#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API
and save the response to a file.
"""
import requests
import json
import random
import string

def generate_random_filename(extension=".py"):
    """Generate a random filename with the given extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}{extension}"

def call_rest_api(url):
    """Call a REST API and return the response."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        return response.json()  # Return JSON response
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None

def save_response_to_file(data, filename):
    """Save the API response to a file."""
    try:
        with open(filename, 'w') as f:
            json.dump(data, f, indent=2)
        print(f"Response saved to {filename}")
        return True
    except Exception as e:
        print(f"Error saving to file: {e}")
        return False

def main():
    # Example API - you can change this to any REST API you want to call
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print(f"Calling API: {api_url}")
    response_data = call_rest_api(api_url)
    
    if response_data:
        # Generate a random filename
        random_filename = generate_random_filename(".py")
        print(f"Generated random filename: {random_filename}")
        
        # Save the response to the randomly named file
        success = save_response_to_file(response_data, random_filename)
        
        if success:
            print(f"Successfully saved API response to {random_filename}")
        else:
            print("Failed to save API response")
    else:
        print("Failed to get API response")

if __name__ == "__main__":
    main()