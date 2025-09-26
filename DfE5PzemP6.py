import requests
import json

def call_api_and_save(url, output_file):
  """
  Calls a REST API, retrieves JSON data, and saves it to a file.

  Args:
    url: The URL of the REST API endpoint.
    output_file: The name of the file to save the data to.
  """
  try:
    response = requests.get(url)
    response.raise_for_status()  # Raise an exception for bad status codes (4xx or 5xx)

    data = response.json()

    with open(output_file, 'w', encoding='utf-8') as f:
      json.dump(data, f, indent=2)

    print(f"API data successfully retrieved and saved to {output_file}")

  except requests.exceptions.RequestException as e:
    print(f"An error occurred while making the API request: {e}")
  except json.JSONDecodeError:
    print("An error occurred while decoding the JSON response.")
  except IOError as e:
    print(f"An error occurred while writing to the file: {e}")

if __name__ == "__main__":
  # Example API: JSONPlaceholder, a fake online REST API for testing
  API_URL = "https://jsonplaceholder.typicode.com/posts/1"
  OUTPUT_FILE = "api_output.json"

  call_api_and_save(API_URL, OUTPUT_FILE)
