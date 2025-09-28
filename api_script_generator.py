import os
import uuid
import requests

def generate_api_script():
    """Generates a Python script that calls a REST API using requests."""

    # Example API: JSONPlaceholder for demonstration
    api_url = "https://jsonplaceholder.typicode.com/posts/1"
    
    # Generate a random filename
    random_filename = f"api_call_script_{uuid.uuid4().hex[:8]}.py"

    script_content = f'''import requests

def main():
    url = "{api_url}"
    response = requests.get(url)

    if response.status_code == 200:
        data = response.json()
        print("API Call Successful!")
        print("Data received:")
        print(data)
    else:
        print(f"Error: Received status code {{response.status_code}}")

if __name__ == "__main__":
    main()
'''

    with open(random_filename, 'w') as f:
        f.write(script_content)

    print(f"Python script generated and saved as: {random_filename}")

if __name__ == "__main__":
    generate_api_script()
