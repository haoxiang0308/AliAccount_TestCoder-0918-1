import random
import string
from pymongo import MongoClient

def generate_random_name(length=8):
    """Generate a random string of fixed length."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def insert_document():
    # Connect to MongoDB (assuming local instance)
    client = MongoClient('mongodb://localhost:27017/')
    
    # Access database and collection
    db = client['test_database']
    collection = db['test_collection']
    
    # Create a sample document
    document = {
        "name": "John Doe",
        "email": "john.doe@example.com",
        "age": 30,
        "random_id": generate_random_name()
    }
    
    # Insert document
    result = collection.insert_one(document)
    print(f"Document inserted with ID: {result.inserted_id}")
    
    # Verify insertion by finding the document
    inserted_doc = collection.find_one({"_id": result.inserted_id})
    print(f"Retrieved document: {inserted_doc}")
    
    # Close connection
    client.close()

if __name__ == "__main__":
    insert_document()