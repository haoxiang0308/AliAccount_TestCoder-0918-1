#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API and save the response.
"""
import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def fetch_api_data(url):
    """Fetch data from the provided API URL."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data from API: {e}")
        return None

def save_data_to_file(data, filename):
    """Save the API response data to a file."""
    try:
        with open(filename, 'w') as file:
            json.dump(data, file, indent=2)
        print(f"Data successfully saved to {filename}")
        return True
    except IOError as e:
        print(f"Error saving data to file: {e}")
        return False

def main():
    # Example API endpoint - you can change this to any REST API
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print(f"Fetching data from: {api_url}")
    
    # Fetch data from the API
    api_data = fetch_api_data(api_url)
    
    if api_data:
        # Generate a random filename
        random_filename = generate_random_filename()
        
        # Save the data to the randomly named file
        success = save_data_to_file(api_data, random_filename)
        
        if success:
            print(f"Script completed successfully. Data saved to {random_filename}")
        else:
            print("Script failed to save data.")
    else:
        print("Script failed to fetch data from the API.")

if __name__ == "__main__":
    main()