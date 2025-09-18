import random
import string
from pymongo import MongoClient
from pymongo.errors import ServerSelectionTimeoutError

def generate_random_string(length=8):
    """Generate a random string of fixed length"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def insert_document():
    try:
        # Connect to MongoDB (assuming local instance)
        client = MongoClient('mongodb://localhost:27017/', serverSelectionTimeoutMS=5000)
        
        # Test the connection
        client.admin.command('ping')
        
        # Select database and collection
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
        
        # Retrieve and print the document to confirm insertion
        inserted_doc = collection.find_one({"_id": result.inserted_id})
        print(f"Retrieved document: {inserted_doc}")
        
        # Close the connection
        client.close()
        
    except ServerSelectionTimeoutError:
        print("Could not connect to MongoDB. Please ensure MongoDB is installed and running on localhost:27017")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    insert_document()