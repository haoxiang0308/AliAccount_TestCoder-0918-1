#!/usr/bin/env python3
"""
Python script using PyMongo to insert a document into MongoDB
"""

from pymongo import MongoClient
import random
import string

def generate_random_document():
    """Generate a random document to insert into MongoDB"""
    doc = {
        "name": "Test Document",
        "value": random.randint(1, 100),
        "description": "Random document created at " + ''.join(random.choices(string.ascii_letters + string.digits, k=10)),
        "timestamp": "2023-10-30",
        "status": "active"
    }
    return doc

def main():
    # Connect to MongoDB (assuming it's running locally on default port)
    try:
        client = MongoClient('mongodb://localhost:27017/')
        
        # Access database and collection
        db = client['test_database']
        collection = db['test_collection']
        
        # Generate and insert a random document
        document = generate_random_document()
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        print(f"Document inserted: {document}")
        
        # Close the connection
        client.close()
        print("Connection closed.")
        
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()