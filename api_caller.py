import requests
import json
import random
import string


def generate_random_filename():
    """Generates a random filename with .py extension."""
    random_str = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"{random_str}.py"


def call_rest_api(url):
    """Calls a REST API and returns the response."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses (4xx or 5xx)
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {e}")
        return None


def save_script_to_file(filename, url):
    """Saves the script content to a file."""
    script_content = f'''
import requests
import json


def call_rest_api(url):
    """Calls a REST API and returns the response."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses (4xx or 5xx)
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {{e}}")
        return None


# Example usage
api_url = "{url}"
data = call_rest_api(api_url)
if data:
    print(json.dumps(data, indent=4))
'''
    with open(filename, 'w') as f:
        f.write(script_content)
    print(f"Script saved to {filename}")


if __name__ == "__main__":
    # Example API endpoint
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    # Call the API
    data = call_rest_api(api_url)
    if data:
        print("API Response:")
        print(json.dumps(data, indent=4))
    
    # Generate a random filename and save the script
    filename = generate_random_filename()
    save_script_to_file(filename, api_url)