import requests

# This script was generated automatically.
# It calls a REST API and prints the response.

def call_api():
    url = "https://jsonplaceholder.typicode.com/posts/1"
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        print("API Response:")
        print(response.json()) # Assuming the API returns JSON
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    call_api()
