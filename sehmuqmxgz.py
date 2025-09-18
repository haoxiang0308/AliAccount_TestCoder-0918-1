import random
import string
from pymongo import MongoClient
from pymongo.errors import ConnectionFailure, ServerSelectionTimeoutError

def generate_random_string(length=10):
    """Generate a random string of specified length"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def insert_document():
    """Insert a sample document into MongoDB"""
    try:
        # Connect to MongoDB (assuming local instance)
        client = MongoClient('mongodb://localhost:27017/', serverSelectionTimeoutMS=2000)
        
        # Test the connection
        client.admin.command('ping')
        
        # Access database and collection
        db = client['test_database']
        collection = db['test_collection']
        
        # Create a sample document
        document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "random_id": generate_random_string()
        }
        
        # Insert the document
        result = collection.insert_one(document)
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Retrieve and print the inserted document
        inserted_doc = collection.find_one({"_id": result.inserted_id})
        print("Inserted document:", inserted_doc)
        
        # Close the connection
        client.close()
        
    except (ConnectionFailure, ServerSelectionTimeoutError):
        print("Could not connect to MongoDB. Here's what the document would look like:")
        document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "random_id": generate_random_string()
        }
        print(document)
        print("\nTo actually insert documents into MongoDB, you need to:")
        print("1. Install MongoDB server")
        print("2. Start the MongoDB service")
        print("3. Run this script again")

if __name__ == "__main__":
    insert_document()