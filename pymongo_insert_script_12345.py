import pymongo
import random
import string
from datetime import datetime

def generate_random_collection_name():
    """Generate a random collection name"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(10))

def insert_document_to_mongodb():
    """
    Connect to MongoDB and insert a document
    Note: This assumes MongoDB is running locally on default port 27017
    """
    try:
        # Create a MongoDB client (assumes MongoDB is running locally)
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        
        # Create/access a database
        db = client["sample_database"]
        
        # Generate a random collection name
        collection_name = generate_random_collection_name()
        collection = db[collection_name]
        
        # Create a document to insert
        document = {
            "name": "John Doe",
            "email": f"john{random.randint(1000, 9999)}@example.com",
            "age": random.randint(18, 65),
            "created_at": datetime.now(),
            "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))
        }
        
        # Insert the document
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        print(f"Database: sample_database")
        print(f"Collection: {collection_name}")
        print(f"Document: {document}")
        
        # Close the connection
        client.close()
        
    except Exception as e:
        print(f"An error occurred: {e}")
        print("Make sure MongoDB is running on your system")

if __name__ == "__main__":
    insert_document_to_mongodb()