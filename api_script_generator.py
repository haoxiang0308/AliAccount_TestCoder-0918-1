import os
import random
import string

def generate_random_filename(ext='.py'):
    """Generates a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_name}{ext}"

script_content = '''
import requests

def call_api_and_save():
    # Example API call to a public API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes

        # Print the response data
        print("API Response:")
        print(response.json())

        # Optionally, save the response data to a file
        with open("api_response.json", "w") as f:
            f.write(response.text)
        print("Response saved to api_response.json")

    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    call_api_and_save()
'''

# Generate a random filename and write the script
random_filename = generate_random_filename()
full_path = os.path.join('/workspace', random_filename)

with open(full_path, 'w') as f:
    f.write(script_content.strip())

print(f"Python script created: {full_path}")