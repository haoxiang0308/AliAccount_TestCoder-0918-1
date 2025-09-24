import requests
import json

def call_api_and_save(url, output_file):
  """
  Calls a REST API, gets the JSON response, and saves it to a file.
  """
  try:
    response = requests.get(url)
    response.raise_for_status()  # Raise an exception for bad status codes (4xx or 5xx)

    data = response.json()

    with open(output_file, 'w', encoding='utf-8') as f:
      json.dump(data, f, indent=2)

    print(f"API response saved to {output_file}")

  except requests.exceptions.RequestException as e:
    print(f"An error occurred while calling the API: {e}")
  except json.JSONDecodeError:
    print("The API response was not valid JSON.")
  except IOError as e:
    print(f"An error occurred while writing the file: {e}")

if __name__ == "__main__":
  API_URL = "https://jsonplaceholder.typicode.com/posts/1"  # Example API
  OUTPUT_FILE = "api_response.json"
  call_api_and_save(API_URL, OUTPUT_FILE)
