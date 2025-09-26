import requests
import json
import random
import string

def generate_random_filename(length=10):
    """Generates a random filename with a .py extension."""
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(length))
    return f"{random_string}.py"

def fetch_and_save_api_data(url, output_filename):
    """Fetches data from a REST API and saves the script to a file."""
    # Example API call (using JSONPlaceholder for demonstration)
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes

        api_data = response.json()

        # Create a simple script that fetches and prints the data
        script_content = f'''import requests

# Auto-generated script to fetch data from {url}
def fetch_data():
    response = requests.get("{url}")
    response.raise_for_status()
    data = response.json()
    return data

if __name__ == "__main__":
    data = fetch_data()
    print("Data fetched from API:")
    print(data)

'''
        with open(output_filename, 'w', encoding='utf-8') as f:
            f.write(script_content)

        print(f"Script successfully written to {output_filename}")

    except requests.exceptions.RequestException as e:
        print(f"An error occurred while fetching data: {e}")
    except IOError as e:
        print(f"An error occurred while writing the file: {e}")

if __name__ == "__main__":
    api_url = "https://jsonplaceholder.typicode.com/posts/1"  # Example API
    filename = generate_random_filename()
    fetch_and_save_api_data(api_url, filename)
