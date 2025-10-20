#!/usr/bin/env python3
"""
Python script using PyMongo to insert a document into MongoDB
"""

from pymongo import MongoClient
import random
import string

def generate_random_string(length=10):
    """Generate a random string of specified length"""
    letters = string.ascii_letters + string.digits
    return ''.join(random.choice(letters) for i in range(length))

def main():
    # Connect to MongoDB (assuming it's running locally on default port 27017)
    # If using a remote MongoDB instance, replace 'localhost' with the appropriate host
    try:
        client = MongoClient('mongodb://localhost:27017/')
        
        # Create/access a database
        db = client['sample_database']
        
        # Create/access a collection
        collection = db['sample_collection']
        
        # Create a sample document to insert
        sample_document = {
            'name': f'John Doe {generate_random_string(5)}',
            'email': f'john{generate_random_string(3)}@example.com',
            'age': random.randint(18, 80),
            'created_at': generate_random_string(15),  # In a real scenario, you might use datetime
            'random_id': generate_random_string(12)
        }
        
        # Insert the document
        result = collection.insert_one(sample_document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        print(f"Inserted document: {sample_document}")
        
        # Verify the insertion by finding the document
        found_document = collection.find_one({'_id': result.inserted_id})
        print(f"Verified document from database: {found_document}")
        
        # Close the connection
        client.close()
        
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()