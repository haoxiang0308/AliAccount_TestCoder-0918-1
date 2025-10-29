import requests
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
