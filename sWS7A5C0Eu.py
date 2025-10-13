import requests

def call_api_and_save():
    # Example API call to a public API
    url = "https://jsonplaceholder.typicode.com/posts/1"
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes

        # Print the response data
        print("API Response:")
        print(response.json())

        # Optionally, save the response data to a file
        with open("api_response.json", "w") as f:
            f.write(response.text)
        print("Response saved to api_response.json")

    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    call_api_and_save()