#!/usr/bin/env python3
"""
PyMongo script to insert a document into a MongoDB collection.
This script connects to a MongoDB instance and inserts a sample document.
"""

from pymongo import MongoClient
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(8))
    return f"{random_name}.py"

def insert_document():
    """
    Connect to MongoDB and insert a sample document.
    Note: This example assumes MongoDB is running locally on default port.
    For actual use, you would need to provide connection string and credentials.
    """
    try:
        # Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
        client = MongoClient('mongodb://localhost:27017/')
        
        # Create/access a database
        db = client['sample_database']
        
        # Create/access a collection
        collection = db['sample_collection']
        
        # Create a sample document to insert
        document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "city": "New York",
            "created_at": "2023-01-01"
        }
        
        # Insert the document
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
        return str(result.inserted_id)
    
    except Exception as e:
        print(f"An error occurred: {e}")
        return None

if __name__ == "__main__":
    inserted_id = insert_document()
    if inserted_id:
        print("Document successfully inserted!")
    else:
        print("Failed to insert document.")