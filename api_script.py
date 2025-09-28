import requests
import json
import random
import string

def random_filename():
    """Generates a random filename with a .py extension."""
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_string}.py"

# Example API call (replace with your desired API)
url = "https://jsonplaceholder.typicode.com/posts/1"
response = requests.get(url)

if response.status_code == 200:
    data = response.json()

    # Generate a random filename
    filename = random_filename()

    # Save the API response to the randomly named file
    with open(filename, 'w') as f:
        f.write(json.dumps(data, indent=4))

    print(f"API response saved to {filename}")
else:
    print(f"Failed to retrieve data. Status code: {response.status_code}")
