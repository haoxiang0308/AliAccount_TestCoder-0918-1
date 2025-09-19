import requests
import json
import random
import string

def generate_random_filename(length=10):
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(length))
    return random_name + ".py"

def call_rest_api(url):
    """Call a REST API and return the response"""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error calling API: {e}")
        return None

def save_script_to_file(filename):
    """Save a sample script to a file"""
    script_content = '''
import requests

def fetch_data():
    """Fetch data from a public API"""
    url = "https://jsonplaceholder.typicode.com/posts/1"
    try:
        response = requests.get(url)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error: {e}")
        return None

if __name__ == "__main__":
    data = fetch_data()
    if data:
        print("Data fetched successfully:")
        print(data)
    else:
        print("Failed to fetch data")
'''
    
    with open(filename, 'w') as file:
        file.write(script_content)
    print(f"Script saved to {filename}")

if __name__ == "__main__":
    # Generate a random filename
    filename = generate_random_filename()
    
    # Save the script
    save_script_to_file(filename)
    
    # Optionally, demonstrate calling an API
    print("Testing API call...")
    api_data = call_rest_api("https://jsonplaceholder.typicode.com/posts/1")
    if api_data:
        print("API call successful. Sample data:")
        print(json.dumps(api_data, indent=2))