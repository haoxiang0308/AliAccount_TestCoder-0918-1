import requests

# Auto-generated script to fetch data from https://jsonplaceholder.typicode.com/posts/1
def fetch_data():
    response = requests.get("https://jsonplaceholder.typicode.com/posts/1")
    response.raise_for_status()
    data = response.json()
    return data

if __name__ == "__main__":
    data = fetch_data()
    print("Data fetched from API:")
    print(data)

