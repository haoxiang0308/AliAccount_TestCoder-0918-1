
import requests
import json


def call_rest_api(url):
    """Calls a REST API and returns the response."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses (4xx or 5xx)
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {e}")
        return None


# Example usage
api_url = "https://jsonplaceholder.typicode.com/posts/1"
data = call_rest_api(api_url)
if data:
    print(json.dumps(data, indent=4))
