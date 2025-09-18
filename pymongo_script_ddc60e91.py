import random
import string
from pymongo import MongoClient

def generate_random_name(length=8):
    """Generate a random string for the database name"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for _ in range(length))

# Connect to MongoDB (assuming it's running locally on default port)
client = MongoClient('mongodb://localhost:27017/')

# Generate a random database and collection name
db_name = generate_random_name()
collection_name = generate_random_name()

# Access the database and collection
db = client[db_name]
collection = db[collection_name]

# Create a sample document to insert
document = {
    "name": "John Doe",
    "email": "john.doe@example.com",
    "age": 30,
    "interests": ["reading", "coding", "hiking"]
}

# Insert the document
result = collection.insert_one(document)

print(f"Connected to database: {db_name}")
print(f"Inserted document into collection: {collection_name}")
print(f"Inserted document ID: {result.inserted_id}")

# Verify the insertion by finding the document
found_document = collection.find_one({"_id": result.inserted_id})
print(f"Found document: {found_document}")

# Close the connection
client.close()