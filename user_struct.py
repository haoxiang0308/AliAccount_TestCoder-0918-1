import json
import random
import string

class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

def generate_random_filename(extension="json"):
    """Generate a random filename with the given extension."""
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"user_data_{random_string}.{extension}"

def main():
    # Create a new user
    user = User(name="Alice", age=30)
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Convert user object to dictionary
    user_dict = {
        "name": user.name,
        "age": user.age
    }
    
    # Save user data to the file
    with open(random_filename, 'w') as file:
        json.dump(user_dict, file)
    
    print(f"User data saved to file: {random_filename}")
    print(f"User: Name: {user.name}, Age: {user.age}")

if __name__ == "__main__":
    main()