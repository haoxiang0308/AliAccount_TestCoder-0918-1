import requests

def main():
    url = "https://jsonplaceholder.typicode.com/posts/1"
    response = requests.get(url)

    if response.status_code == 200:
        data = response.json()
        print("API Call Successful!")
        print("Data received:")
        print(data)
    else:
        print(f"Error: Received status code {response.status_code}")

if __name__ == "__main__":
    main()
