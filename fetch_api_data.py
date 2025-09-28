import requests
import random
import string

# Example: Fetching a random user from the JSONPlaceholder API
url = "https://jsonplaceholder.typicode.com/users/1"

try:
    response = requests.get(url)
    response.raise_for_status()  # Raises an HTTPError for bad responses (4xx or 5xx)

    data = response.json()

    # Generate a random filename
    random_filename = "api_data_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".py"

    # Save the API response data to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(f"# Data fetched from {url}\n")
        f.write("api_response = ")
        f.write(repr(data))
        f.write("\n")
    
    print(f"API data successfully fetched and saved to {random_filename}")

except requests.exceptions.RequestException as e:
    print(f"An error occurred while fetching data: {e}")
except IOError as e:
    print(f"An error occurred while writing the file: {e}")
