#!/usr/bin/env python3
"""
A simple Python script using Requests to call a REST API
"""

import requests
import json


def fetch_data_from_api(url):
    """
    Fetch data from a REST API endpoint
    
    Args:
        url (str): The API endpoint URL
        
    Returns:
        dict: The JSON response from the API
    """
    try:
        # Make a GET request to the API
        response = requests.get(url)
        
        # Raise an exception for bad status codes
        response.raise_for_status()
        
        # Parse and return JSON response
        return response.json()
        
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while fetching data: {e}")
        return None


def main():
    # Example API endpoint (JSONPlaceholder is a free testing API)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print(f"Fetching data from {api_url}...")
    
    # Fetch data from the API
    data = fetch_data_from_api(api_url)
    
    if data:
        print("Data fetched successfully!")
        print(json.dumps(data, indent=2))
    else:
        print("Failed to fetch data from the API.")


if __name__ == "__main__":
    main()