import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
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

def save_script_to_file(filename):
    """Save a sample API calling script to a file"""
    script_content = '''
import requests
import json

def fetch_data_from_api(url):
    """Fetch data from a REST API endpoint"""
    try:
        response = requests.get(url)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data: {e}")
        return None

def main():
    # Example API endpoint (free REST API for testing)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print("Calling REST API...")
    data = fetch_data_from_api(api_url)
    
    if data:
        print("Data received successfully:")
        print(json.dumps(data, indent=2))
    else:
        print("Failed to fetch data from API")

if __name__ == "__main__":
    main()
'''
    
    with open(filename, 'w') as file:
        file.write(script_content)
    
    print(f"Script saved to {filename}")

def main():
    # Generate a random filename
    filename = generate_random_filename()
    
    # Save the script to the randomly named file
    save_script_to_file(filename)
    
    # Demonstrate calling an API
    print("Demonstrating API call:")
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    data = call_rest_api(api_url)
    
    if data:
        print("Sample API response:")
        print(json.dumps(data, indent=2))

if __name__ == "__main__":
    main()