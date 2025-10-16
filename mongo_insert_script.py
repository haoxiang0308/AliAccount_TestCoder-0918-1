#!/usr/bin/env python3
"""
PyMongo script to insert a document into a MongoDB collection and save to a random .py file.
"""

from pymongo import MongoClient
import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension."""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"{random_name}.py"

def insert_document():
    """
    Connect to MongoDB and insert a sample document.
    """
    try:
        # Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
        client = MongoClient('mongodb://localhost:27017/', serverSelectionTimeoutMS=3000)
        
        # Test the connection
        client.admin.command('ping')
        print("Connected to MongoDB")
        
        # Create or access database
        db = client['sample_db']
        
        # Create or access collection
        collection = db['sample_collection']
        
        # Sample document to insert
        document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "city": "New York",
            "timestamp": "2023-01-01T00:00:00Z",
            "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))
        }
        
        # Insert the document
        result = collection.insert_one(document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
    except Exception as e:
        print(f"Error connecting to MongoDB: {e}")
        return None

def save_current_script_to_random_file():
    """
    Save the current script to a randomly named .py file.
    """
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Get the current script content
    current_script_path = __file__
    
    with open(current_script_path, 'r') as f:
        script_content = f.read()
    
    # Write the script content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to {random_filename}")
    return random_filename

if __name__ == "__main__":
    # Insert a document
    doc_id = insert_document()
    
    # Save this script to a randomly named file
    random_file = save_current_script_to_random_file()
    
    print(f"Process completed. Document ID: {doc_id}, Script saved as: {random_file}")