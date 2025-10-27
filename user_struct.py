import json
import random
import string

# Define a User class with name and age fields (similar to Rust struct)
class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def to_dict(self):
        return {
            "name": self.name,
            "age": self.age
        }

def generate_random_filename(extension="json"):
    """Generate a random filename"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"user_data_{random_string}.{extension}"

def main():
    # Create a user instance
    user = User("Alice", 30)
    
    print(f"Created user: {user.name}, age {user.age}")
    
    # Convert user to dictionary and then to JSON
    user_data = user.to_dict()
    user_json = json.dumps(user_data, indent=2)
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write user data to the file
    with open(random_filename, 'w') as f:
        f.write(user_json)
    
    print(f"User data saved to: {random_filename}")

if __name__ == "__main__":
    main()