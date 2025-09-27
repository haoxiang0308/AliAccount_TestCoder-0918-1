import requests
import json
import random
import string

# Configuration
API_URL = "https://jsonplaceholder.typicode.com/posts/1"  # Example API
OUTPUT_FILE_PREFIX = "api_output_"
OUTPUT_FILE_EXTENSION = ".json"

def fetch_and_save_data():
    """Fetches data from the API and saves it to a randomly named JSON file."""
    try:
        print(f"Fetching data from {API_URL}...")
        response = requests.get(API_URL)
        response.raise_for_status()  # Raise an exception for bad status codes

        data = response.json()
        print("Data fetched successfully.")

        # Generate a random filename
        random_suffix = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
        filename = f"{OUTPUT_FILE_PREFIX}{random_suffix}{OUTPUT_FILE_EXTENSION}"

        print(f"Saving data to {filename}...")
        with open(filename, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=2)

        print(f"Data successfully saved to {filename}.")

    except requests.exceptions.RequestException as e:
        print(f"An error occurred while fetching data: {e}")
    except json.JSONDecodeError as e:
        print(f"An error occurred while parsing JSON: {e}")
    except IOError as e:
        print(f"An error occurred while writing the file: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    fetch_and_save_data()
