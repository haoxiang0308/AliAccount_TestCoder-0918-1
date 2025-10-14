import requests
import os
import random
import string

def generate_random_filename(length=8, prefix="", suffix=".py"):
    """Generates a random filename."""
    random_chars = ''.join(random.choice(string.ascii_lowercase + string.digits) for _ in range(length))
    return f"{prefix}{random_chars}{suffix}"

def fetch_and_save_api_data(url, output_dir="."):
    """Fetches data from a REST API and saves it to a randomly named .py file."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes

        # Generate a random filename
        random_filename = generate_random_filename(prefix="api_data_", suffix=".py")
        output_path = os.path.join(output_dir, random_filename)

        # Write the API response to the file
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(f"# Data fetched from {url}\n\n")
            f.write("api_response = ")
            # Pretty-print the JSON response using repr for basic serialization
            f.write(repr(response.json()))

        print(f"API data successfully fetched and saved to {output_path}")
        return output_path

    except requests.exceptions.RequestException as e:
        print(f"An error occurred while fetching the API: {e}")
    except IOError as e:
        print(f"An error occurred while writing the file: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    # Example API endpoint (JSONPlaceholder is a common test API)
    API_URL = "https://jsonplaceholder.typicode.com/posts/1"
    OUTPUT_DIRECTORY = "/workspace"

    saved_file_path = fetch_and_save_api_data(API_URL, OUTPUT_DIRECTORY)