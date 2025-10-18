import pymongo
import random
import string
import os

# Create a random filename
def generate_random_filename():
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Create a new Python file with random name containing a PyMongo script
random_filename = generate_random_filename()

# Content for the new randomly named file - this is a PyMongo script that inserts a document
new_file_content = '''import pymongo
import random
import string

# Connect to MongoDB (assuming local installation with default settings)
try:
    client = pymongo.MongoClient("mongodb://localhost:27017/")
    
    # Create/access a database
    db = client["sample_database"]
    
    # Create/access a collection
    collection = db["sample_collection"]
    
    # Create a sample document to insert
    sample_document = {
        "name": "John Doe",
        "email": "john.doe@example.com",
        "age": 30,
        "city": "New York",
        "date_created": "2023-01-01",
        "random_id": ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    }
    
    # Insert the document
    result = collection.insert_one(sample_document)
    print(f"Document inserted with ID: {result.inserted_id}")
    
    # Verify the document was inserted
    retrieved_doc = collection.find_one({"_id": result.inserted_id})
    print(f"Retrieved document: {retrieved_doc}")
    
except pymongo.errors.ConnectionFailure:
    print("Could not connect to MongoDB. Please make sure MongoDB is running.")
except Exception as e:
    print(f"An error occurred: {e}")
finally:
    if 'client' in locals():
        client.close()
'''

# Write the content to the randomly named file
with open(random_filename, 'w') as file:
    file.write(new_file_content)

print(f"New Python script with PyMongo functionality saved to: {random_filename}")

# Also run the original script to insert a document if MongoDB is available
try:
    client = pymongo.MongoClient("mongodb://localhost:27017/", serverSelectionTimeoutMS=2000)  # 2 second timeout
    
    # Test connection
    client.admin.command('ping')
    
    # Create/access a database
    db = client["sample_database"]
    
    # Create/access a collection
    collection = db["sample_collection"]
    
    # Create a sample document to insert
    sample_document = {
        "name": "Original Script",
        "email": "original@example.com",
        "description": "Document inserted by the original script",
        "date_created": "2023-01-01"
    }
    
    # Insert the document
    result = collection.insert_one(sample_document)
    print(f"Document inserted with ID: {result.inserted_id}")
    
except pymongo.errors.ConnectionFailure:
    print("Could not connect to MongoDB. The randomly named file has been created with PyMongo code.")
except Exception as e:
    print(f"An error occurred while connecting to MongoDB: {e}")
finally:
    if 'client' in locals():
        client.close()