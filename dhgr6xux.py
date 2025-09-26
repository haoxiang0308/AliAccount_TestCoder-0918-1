import requests
import json

# Example API call to a public API
response = requests.get("https://jsonplaceholder.typicode.com/posts/1")

if response.status_code == 200:
    data = response.json()
    print("API call successful!")
    print(json.dumps(data, indent=2))
else:
    print(f"API call failed with status code: {response.status_code}")
