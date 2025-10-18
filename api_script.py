#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API
and demonstrates how to handle the response.
"""

import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def fetch_api_data():
    """Fetch data from a REST API and return the response."""
    # Using JSONPlaceholder API which is a free testing API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data from API: {e}")
        return None

def save_data_to_random_file(data):
    """Save the API response data to a randomly named .py file."""
    random_filename = generate_random_filename()
    
    with open(random_filename, 'w') as file:
        file.write("# API Response Data\n")
        file.write("# This file was generated with random name\n\n")
        file.write("api_data = ")
        file.write(json.dumps(data, indent=2))
        file.write("\n\n# End of API data\n")
    
    print(f"API data saved to: {random_filename}")
    return random_filename

def main():
    """Main function to orchestrate the API call and file saving."""
    print("Fetching data from REST API...")
    api_data = fetch_api_data()
    
    if api_data:
        print("Data fetched successfully!")
        print(f"Title: {api_data.get('title', 'N/A')}")
        
        print("Saving data to a randomly named .py file...")
        random_file = save_data_to_random_file(api_data)
        print(f"Data saved to {random_file}")
    else:
        print("Failed to fetch data from API")

if __name__ == "__main__":
    main()