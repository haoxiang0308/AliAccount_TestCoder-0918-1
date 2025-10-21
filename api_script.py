import requests
import random
import string
import os

def call_rest_api():
    """
    Function to call a REST API and display the response
    """
    # Using JSONPlaceholder as a demo API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make the API call
        response = requests.get(url)
        
        # Check if the request was successful
        if response.status_code == 200:
            print("API call successful!")
            print("Response data:")
            print(response.json())
            return response.json()
        else:
            print(f"API call failed with status code: {response.status_code}")
            return None
            
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {e}")
        return None

def generate_random_filename():
    """
    Generate a random filename with .py extension
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def save_script_to_random_file():
    """
    Save this script to a randomly named .py file
    """
    # Get the current script content
    script_content = '''import requests
import random
import string

def call_rest_api():
    """
    Function to call a REST API and display the response
    """
    # Using JSONPlaceholder as a demo API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        # Make the API call
        response = requests.get(url)
        
        # Check if the request was successful
        if response.status_code == 200:
            print("API call successful!")
            print("Response data:")
            print(response.json())
            return response.json()
        else:
            print(f"API call failed with status code: {response.status_code}")
            return None
            
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {e}")
        return None

def main():
    print("Calling REST API...")
    data = call_rest_api()
    if data:
        print("Successfully retrieved data from API!")

if __name__ == "__main__":
    main()
'''
    
    # Generate random filename
    random_filename = generate_random_filename()
    
    # Write the script content to the random filename
    with open(random_filename, 'w') as file:
        file.write(script_content)
    
    print(f"Script saved to: {random_filename}")
    return random_filename

def main():
    print("Calling REST API...")
    data = call_rest_api()
    if data:
        print("Successfully retrieved data from API!")
    
    print("\nSaving script to a randomly named file...")
    random_file = save_script_to_random_file()
    print(f"Created new file: {random_file}")

if __name__ == "__main__":
    main()