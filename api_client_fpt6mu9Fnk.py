#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API
"""

import requests
import json


def call_rest_api(url):
    """
    Call a REST API endpoint and return the response
    
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
        
        # Return the JSON response
        return response.json()
        
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while calling the API: {e}")
        return None


def main():
    # Example API endpoint (JSONPlaceholder is a free testing API)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print(f"Calling REST API: {api_url}")
    
    # Call the API
    data = call_rest_api(api_url)
    
    if data:
        print("API Response:")
        print(json.dumps(data, indent=2))
    else:
        print("Failed to retrieve data from the API")


if __name__ == "__main__":
    main()