import random
import string
from pymongo import MongoClient

def generate_random_name(length=8):
    """Generate a random string of fixed length."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def insert_document():
    # This is a demonstration script. In a real application, you would connect to MongoDB.
    # For this example, we'll simulate the process without actually connecting.
    
    # Simulate creating a sample document
    document = {
        "name": "John Doe",
        "email": "john.doe@example.com",
        "age": 30,
        "random_id": generate_random_name()
    }
    
    print("Document to be inserted:", document)
    print("In a real application, this document would be inserted into MongoDB using:")
    print("  client = MongoClient('mongodb://localhost:27017/')")
    print("  db = client['test_database']")
    print("  collection = db['test_collection']")
    print("  result = collection.insert_one(document)")

if __name__ == "__main__":
    insert_document()