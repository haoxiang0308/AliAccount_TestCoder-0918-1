import pymongo
import random
import string
from datetime import datetime

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{{random_name}}.py"

def insert_document():
    """Connect to MongoDB and insert a sample document"""
    try:
        # Connect to MongoDB (assuming default localhost:27017)
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        
        # Create/access database
        db = client["sample_db"]
        
        # Create/access collection
        collection = db["sample_collection"]
        
        # Sample document to insert
        sample_document = {
            "name": "John Doe",
            "age": 30,
            "email": "john.doe@example.com",
            "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8)),
            "timestamp": datetime.utcnow()
        }
        
        # Insert the document
        result = collection.insert_one(sample_document)
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
        
    except pymongo.errors.ConnectionFailure:
        print("Could not connect to MongoDB. Please make sure MongoDB is running.")
        return None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None

if __name__ == "__main__":
    inserted_id = insert_document()
    if inserted_id:
        print("Document insertion successful!")
    else:
        print("Document insertion failed!")
