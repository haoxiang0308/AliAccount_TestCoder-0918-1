import os
import random
import string
import requests

def generate_random_filename(length=8, prefix='', suffix='.py'):
    """Generates a random filename."""
    random_chars = ''.join(random.choice(string.ascii_lowercase + string.digits) for _ in range(length))
    return f"{prefix}{random_chars}{suffix}"

def create_api_script(filename, api_url='https://jsonplaceholder.typicode.com/posts/1'):
    """Creates a Python script that calls a REST API."""
    script_content = f'''import requests

def main():
    url = "{api_url}"
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses

        print(f"Status Code: {{response.status_code}}")
        print("Response JSON:")
        print(response.json())
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {{e}}")

if __name__ == "__main__":
    main()
'''
    with open(filename, 'w') as f:
        f.write(script_content)
    print(f"API script created: {{filename}}")

if __name__ == "__main__":
    random_filename = generate_random_filename(prefix='api_call_', suffix='.py')
    create_api_script(random_filename)