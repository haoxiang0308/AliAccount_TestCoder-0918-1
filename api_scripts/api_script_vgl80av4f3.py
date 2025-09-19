import requests
import json
import random
import string
import os
import shutil

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"api_script_{random_chars}.py"

def call_rest_api(url):
    """Call a REST API and return the response"""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None

def save_script_to_random_file():
    """Save this script to a randomly named file"""
    # Get the current script's path
    current_file = os.path.abspath(__file__)
    
    # Generate a random filename
    new_filename = generate_random_filename()
    
    # Copy the current script to the new file
    shutil.copy2(current_file, new_filename)
    
    print(f"Script saved to: {new_filename}")
    return new_filename

def main():
    # Example using JSONPlaceholder API
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print(f"Calling REST API: {api_url}")
    data = call_rest_api(api_url)
    
    if data:
        print("API Response:")
        print(json.dumps(data, indent=2))
    else:
        print("Failed to retrieve data from API")
    
    # Save this script to a randomly named file
    save_script_to_random_file()

if __name__ == "__main__":
    main()