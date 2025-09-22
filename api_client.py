import requests
import json
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def fetch_data_from_api():
    """Fetch data from a public REST API"""
    url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching data: {e}")
        return None

def main():
    """Main function to execute the API call and display results"""
    print("Fetching data from REST API...")
    data = fetch_data_from_api()
    
    if data:
        print("Data fetched successfully!")
        print(json.dumps(data, indent=2))
        
        # Save the data to a file with random name
        filename = generate_random_filename()
        with open(filename, 'w') as f:
            f.write("# Data fetched from API\n")
            f.write(f"data = {json.dumps(data, indent=2)}\n")
        
        print(f"Data saved to {filename}")
    else:
        print("Failed to fetch data from API")

if __name__ == "__main__":
    main()