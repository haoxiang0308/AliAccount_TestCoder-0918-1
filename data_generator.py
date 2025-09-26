import json
import random
import string

def generate_mock_data():
    """Generates a mock JSON data structure."""
    data = {
        "users": [
            {
                "id": i,
                "name": f"User {i}",
                "email": f"user{i}@example.com",
                "active": random.choice([True, False])
            }
            for i in range(1, random.randint(3, 6))
        ],
        "total": random.randint(10, 100)
    }
    return data

def save_to_random_file(data, directory="/workspace/data"):
    """Saves the data to a randomly named JSON file in the specified directory."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.json'
    file_path = f"{directory}/{random_name}"
    with open(file_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=2)
    return file_path

if __name__ == "__main__":
    mock_data = generate_mock_data()
    saved_file_path = save_to_random_file(mock_data)
    print(f"Mock data saved to: {saved_file_path}")