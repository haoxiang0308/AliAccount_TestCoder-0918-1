import requests
import json
import random
import string

def call_rest_api():
    """
    Function to call a REST API and display the response
    """
    # Using JSONPlaceholder as a sample REST API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make a GET request to the API
        response = requests.get(url)
        
        # Check if the request was successful
        if response.status_code == 200:
            print("API call successful!")
            print("Response data:")
            print(json.dumps(response.json(), indent=2))
            return response.json()
        else:
            print(f"API call failed with status code: {response.status_code}")
            return None
            
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while making the API call: {e}")
        return None

def generate_random_filename():
    """
    Generate a random filename with .py extension
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

if __name__ == "__main__":
    # Call the API
    api_data = call_rest_api()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    print(f"\nGenerated random filename: {random_filename}")
    
    # If you want to save this script with a random name, 
    # you would typically do that from another script.
    # For demonstration, I'll create a simple version of this script with the random name.
    
    # Create the content for the new file
    script_content = '''import requests
import json

def call_rest_api():
    """
    Function to call a REST API and display the response
    """
    # Using JSONPlaceholder as a sample REST API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make a GET request to the API
        response = requests.get(url)
        
        # Check if the request was successful
        if response.status_code == 200:
            print("API call successful!")
            print("Response data:")
            print(json.dumps(response.json(), indent=2))
            return response.json()
        else:
            print(f"API call failed with status code: {response.status_code}")
            return None
            
    except requests.exceptions.RequestException as e:
        print(f"An error occurred while making the API call: {e}")
        return None

if __name__ == "__main__":
    api_data = call_rest_api()
'''
    
    # Write the content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to {random_filename}")