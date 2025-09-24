import requests

def main():
    url = "https://jsonplaceholder.typicode.com/posts/1"
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raises an HTTPError for bad responses

        print(f"Status Code: {response.status_code}")
        print("Response JSON:")
        print(response.json())
    except requests.exceptions.RequestException as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()
