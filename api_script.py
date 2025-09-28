import requests
import random
import string

def generate_random_filename():
    """Generates a random filename with a .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def fetch_and_save_api_data(url, output_filename):
    """Fetches data from a REST API and saves the script to a file."""
    script_content = f'''import requests

# This script was generated automatically.
# It calls a REST API and prints the response.

def call_api():
    url = "{url}"
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        print("API Response:")
        print(response.json()) # Assuming the API returns JSON
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {{e}}")

if __name__ == "__main__":
    call_api()
'''

    with open(output_filename, 'w') as f:
        f.write(script_content)
    print(f"Script saved to {output_filename}")

if __name__ == "__main__":
    api_url = "https://jsonplaceholder.typicode.com/posts/1"  # Example API
    random_filename = generate_random_filename()
    fetch_and_save_api_data(api_url, random_filename)
