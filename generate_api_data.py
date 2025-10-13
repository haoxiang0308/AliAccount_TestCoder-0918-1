import json
import random
import string

def generate_api_response():
    """Generates a mock API response as a dictionary."""
    data = {
        "status": "success",
        "data": {
            "id": random.randint(1, 10000),
            "name": "".join(random.choices(string.ascii_letters, k=8)),
            "email": f"{''.join(random.choices(string.ascii_lowercase, k=5))}@example.com",
            "age": random.randint(18, 80),
            "active": random.choice([True, False])
        },
        "message": "User data retrieved successfully."
    }
    return data

def save_to_random_file(data):
    """Saves the data to a randomly named JSON file."""
    random_filename = f"api_response_{''.join(random.choices(string.ascii_lowercase + string.digits, k=6))}.json"
    with open(random_filename, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=4, ensure_ascii=False)
    print(f"Data saved to {random_filename}")

if __name__ == "__main__":
    api_data = generate_api_response()
    save_to_random_file(api_data)
