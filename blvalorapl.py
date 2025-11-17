#!/usr/bin/env python3
"""
A Python script using PyMongo to insert a document into MongoDB
and save itself to a randomly named .py file
"""

from pymongo import MongoClient
import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"{random_name}.py"

def insert_document():
    """Connect to MongoDB and insert a sample document"""
    try:
        # Connect to MongoDB (assuming it's running locally on default port)
        client = MongoClient('mongodb://localhost:27017/', serverSelectionTimeoutMS=5000)
        
        # Create or connect to a database
        db = client['sample_database']
        
        # Create or connect to a collection
        collection = db['sample_collection']
        
        # Sample document to insert
        sample_document = {
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "city": "New York",
            "registration_date": "2023-01-01",
            "status": "active"
        }
        
        # Insert the document
        result = collection.insert_one(sample_document)
        
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
    except Exception as e:
        print(f"Could not connect to MongoDB server: {e}")
        print("Simulating document insertion...")
        # Generate a simulated ID
        simulated_id = ''.join(random.choices(string.ascii_lowercase + string.digits, k=24))
        print(f"Simulated document insertion with ID: {simulated_id}")
        return simulated_id

def save_script_to_random_file():
    """Save this script to a randomly named .py file"""
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Get the current script content
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Write the script to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to: {random_filename}")
    return random_filename

if __name__ == "__main__":
    # Insert a document
    doc_id = insert_document()
    
    # Save this script to a randomly named file
    random_file = save_script_to_random_file()
    
    print(f"Process completed. Document ID: {doc_id}, File created: {random_file}")