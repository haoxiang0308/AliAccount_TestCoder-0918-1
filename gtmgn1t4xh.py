#!/usr/bin/env python3
"""
A Python script using PyMongo to connect to MongoDB and insert a document.
"""

from pymongo import MongoClient
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    # Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
    try:
        client = MongoClient('mongodb://localhost:27017/', serverSelectionTimeoutMS=2000)  # 2 second timeout
        
        # Test connection
        client.admin.command('ping')
        
        # Create/access a database
        db = client['test_database']
        
        # Create/access a collection
        collection = db['test_collection']
        
        # Create a sample document to insert
        document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "city": "New York",
            "timestamp": "2023-01-01T00:00:00Z"
        }
        
        # Insert the document into the collection
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Verify the insertion by finding the document
        inserted_doc = collection.find_one({"_id": result.inserted_id})
        print(f"Inserted document: {inserted_doc}")
        
    except Exception as e:
        print(f"Could not connect to MongoDB or perform operations: {e}")
        print("Creating a random .py file with the script content anyway...")
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Save this script to the randomly named file
    with open(__file__, 'r') as source_file:
        script_content = source_file.read()
    
    with open(random_filename, 'w') as output_file:
        output_file.write(script_content)
    
    print(f"Script saved to: {random_filename}")
    
    # Close the MongoDB connection if client was created and is valid
    try:
        client.close()
    except:
        pass  # Client might not have been initialized if connection failed

if __name__ == "__main__":
    main()