#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API
and display the response.
"""

import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def call_rest_api():
    """
    Call a REST API and return the response.
    Using JSONPlaceholder API for demonstration.
    """
    try:
        # Using a public test API
        url = "https://jsonplaceholder.typicode.com/posts/1"
        response = requests.get(url)
        
        # Raise an exception for bad status codes
        response.raise_for_status()
        
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error making API request: {e}")
        return None

def save_script_to_random_file():
    """Save this script to a randomly named .py file."""
    # Get the content of this script
    script_content = '''#!/usr/bin/env python3
"""
A Python script that uses the Requests library to call a REST API
and display the response.
"""

import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def call_rest_api():
    """
    Call a REST API and return the response.
    Using JSONPlaceholder API for demonstration.
    """
    try:
        # Using a public test API
        url = "https://jsonplaceholder.typicode.com/posts/1"
        response = requests.get(url)
        
        # Raise an exception for bad status codes
        response.raise_for_status()
        
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error making API request: {e}")
        return None

def main():
    print("Calling REST API...")
    data = call_rest_api()
    
    if data:
        print("API Response:")
        print(json.dumps(data, indent=2))
        
        # Generate random filename and save this script to it
        random_filename = generate_random_filename()
        with open(random_filename, 'w') as f:
            f.write(script_content)
        print(f"\\nScript saved to: {random_filename}")
    else:
        print("Failed to retrieve data from API")

# Get the actual content of this script
script_content = """ + repr(__doc__ + "\\n" + "\\n".join([line for line in open(__file__).read().splitlines() if not line.startswith('#!/usr/bin/env python3')])) + """

if __name__ == "__main__":
    main()
'''

    # Generate random filename
    random_filename = generate_random_filename()
    
    # Write the script content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to: {random_filename}")
    return random_filename

def main():
    print("Calling REST API...")
    data = call_rest_api()
    
    if data:
        print("API Response:")
        print(json.dumps(data, indent=2))
        
        # Generate random filename and save this script to it
        random_filename = generate_random_filename()
        with open(random_filename, 'w') as f:
            f.write(__doc__ + "\n" + "\n".join([line for line in open(__file__).read().splitlines() if not line.startswith('#!/usr/bin/env python3')]))
        print(f"\nScript saved to: {random_filename}")
    else:
        print("Failed to retrieve data from API")

if __name__ == "__main__":
    main()