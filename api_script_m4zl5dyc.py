
import requests
import json

def fetch_data_from_api(url):
    """Fetch data from a REST API endpoint"""
    try:
        response = requests.get(url)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data: {e}")
        return None

def main():
    # Example API endpoint (free REST API for testing)
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    print("Calling REST API...")
    data = fetch_data_from_api(api_url)
    
    if data:
        print("Data received successfully:")
        print(json.dumps(data, indent=2))
    else:
        print("Failed to fetch data from API")

if __name__ == "__main__":
    main()
