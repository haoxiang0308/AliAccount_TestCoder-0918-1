#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API
and save the response to a file.
"""

import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def fetch_api_data(url):
    """Fetch data from the given API URL."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data from API: {e}")
        return None

def save_to_random_file(data):
    """Save the API response to a randomly named file."""
    random_filename = generate_random_filename()
    
    try:
        with open(random_filename, 'w') as file:
            json.dump(data, file, indent=2)
        print(f"Data saved to {random_filename}")
        return random_filename
    except IOError as e:
        print(f"Error saving data to file: {e}")
        return None

def main():
    # Example API endpoint (JSONPlaceholder is a free testing API)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print(f"Fetching data from {api_url}...")
    api_data = fetch_api_data(api_url)
    
    if api_data:
        print("Data fetched successfully!")
        print(f"Sample data: {api_data.get('title', 'No title')}")
        
        # Save the data to a randomly named file
        saved_file = save_to_random_file(api_data)
        
        if saved_file:
            print(f"API response saved to {saved_file}")
        else:
            print("Failed to save the API response")
    else:
        print("Failed to fetch data from the API")

if __name__ == "__main__":
    main()