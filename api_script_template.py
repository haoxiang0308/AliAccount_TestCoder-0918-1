import requests
import json

def call_api_and_save(url, output_filename):
  """
  Calls a REST API, retrieves JSON data, and saves it to a file.

  Args:
    url: The URL of the REST API endpoint.
    output_filename: The name of the file to save the data to.
  """
  try:
    response = requests.get(url)
    response.raise_for_status()  # Raise an exception for bad status codes

    data = response.json()

    with open(output_filename, 'w', encoding='utf-8') as f:
      json.dump(data, f, indent=2)

    print(f"API data successfully retrieved and saved to {output_filename}")

  except requests.exceptions.RequestException as e:
    print(f"An error occurred while calling the API: {e}")
  except json.JSONDecodeError:
    print("Error: The response was not valid JSON.")
  except IOError as e:
    print(f"An error occurred while writing to the file: {e}")

if __name__ == "__main__":
  # Example API: JSONPlaceholder, a fake REST API for testing
  api_url = "https://jsonplaceholder.typicode.com/posts/1"
  output_file = "api_output.json"
  call_api_and_save(api_url, output_file)