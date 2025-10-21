import requests
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
