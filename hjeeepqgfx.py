
import requests

def fetch_data():
    """Fetch data from a public API"""
    url = "https://jsonplaceholder.typicode.com/posts/1"
    try:
        response = requests.get(url)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error: {e}")
        return None

if __name__ == "__main__":
    data = fetch_data()
    if data:
        print("Data fetched successfully:")
        print(data)
    else:
        print("Failed to fetch data")
