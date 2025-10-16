#!/usr/bin/env python3
"""
PyMongo script to insert a document into a MongoDB collection.
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
    """
    # Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
    client = MongoClient('mongodb://localhost:27017/')
    
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
        "timestamp": "2023-01-01T00:00:00Z"
    }
    
    # Insert the document
    result = collection.insert_one(document)
    
    print(f"Document inserted with ID: {result.inserted_id}")
    
    # Close the connection
    client.close()
    
    return result.inserted_id

def save_script_to_random_file():
    """
    Save this script to a randomly named .py file.
    """
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # The content of this script
    script_content = '''#!/usr/bin/env python3
"""
PyMongo script to insert a document into a MongoDB collection.
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
    """
    # Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
    client = MongoClient('mongodb://localhost:27017/')
    
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
        "timestamp": "2023-01-01T00:00:00Z"
    }
    
    # Insert the document
    result = collection.insert_one(document)
    
    print(f"Document inserted with ID: {result.inserted_id}")
    
    # Close the connection
    client.close()
    
    return result.inserted_id

def save_script_to_random_file():
    """
    Save this script to a randomly named .py file.
    """
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # The content of this script
    script_content = # This would be the full content of the script
    
    # Write the script content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to {random_filename}")
    return random_filename

if __name__ == "__main__":
    # Insert a document
    doc_id = insert_document()
    
    # Save this script to a randomly named file
    random_file = save_script_to_random_file()
'''

    # Write the script content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to {random_filename}")
    return random_filename

if __name__ == "__main__":
    # Insert a document
    doc_id = insert_document()
    
    # Save this script to a randomly named file
    random_file = save_script_to_random_file()