import requests
import random
import string
import os

def call_rest_api_and_save():
    """
    Calls a REST API and saves the response to a randomly named .py file
    """
    # Example API endpoint (JSONPlaceholder - a fake REST API for testing)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make the API call
        response = requests.get(api_url)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Generate a random filename with .py extension
        random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
        
        # Save the API response to the randomly named file
        with open(random_filename, 'w', encoding='utf-8') as f:
            f.write(f"# API Response saved from {api_url}\n")
            f.write(f"# Saved at: {random_filename}\n\n")
            f.write("api_response = ")
            f.write(repr(response.json()))
        
        print(f"API response saved to: {random_filename}")
        return random_filename
        
    except requests.exceptions.RequestException as e:
        print(f"Error making API request: {e}")
        return None
    except Exception as e:
        print(f"Error saving file: {e}")
        return None

if __name__ == "__main__":
    call_rest_api_and_save()