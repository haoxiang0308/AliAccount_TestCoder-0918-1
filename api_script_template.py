import requests
import json
import random
import string

def call_rest_api():
    """
    Function to call a REST API and display the response
    """
    # Using JSONPlaceholder as a demo API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make a GET request to the API
        response = requests.get(url)
        
        # Check if the request was successful
        response.raise_for_status()
        
        # Parse the JSON response
        data = response.json()
        
        print("API Response:")
        print(json.dumps(data, indent=2))
        
        return data
        
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {e}")
        return None

if __name__ == "__main__":
    # Generate a random filename
    random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    
    # Create the random file with the same content as this script
    with open(random_filename, 'w') as f:
        f.write('''import requests
import json
import random
import string

def call_rest_api():
    """
    Function to call a REST API and display the response
    """
    # Using JSONPlaceholder as a demo API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make a GET request to the API
        response = requests.get(url)
        
        # Check if the request was successful
        response.raise_for_status()
        
        # Parse the JSON response
        data = response.json()
        
        print("API Response:")
        print(json.dumps(data, indent=2))
        
        return data
        
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {e}")
        return None

if __name__ == "__main__":
    call_rest_api()
''')
    
    print(f"A new script has been created with the name: {random_filename}")
    
    # Call the API
    result = call_rest_api()