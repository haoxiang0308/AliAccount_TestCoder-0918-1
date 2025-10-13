import requests
import json

# Example: Fetching data from a public API
url = "https://jsonplaceholder.typicode.com/posts/1"
response = requests.get(url)

if response.status_code == 200:
    data = response.json()
    print("Data fetched successfully!")
    # Save the data to a file
    with open("api_response.json", "w") as f:
        json.dump(data, f, indent=4)
    print("Data saved to api_response.json")
else:
    print(f"Failed to fetch data. Status code: {response.status_code}")
