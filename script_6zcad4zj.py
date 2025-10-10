"""
This script was dynamically generated with a random name.
It contains the core PyMongo logic to insert a document into a MongoDB collection.
"""
import random
import string
from pymongo import MongoClient

# Connect to MongoDB (assumes a local instance or standard connection string)
# Note: This will fail if MongoDB is not running at 'localhost:27017'.
client = MongoClient('mongodb://localhost:27017/')

# Access a database (creates it if it doesn't exist)
db = client['my_test_database']

# Access a collection (creates it if it doesn't exist)
collection = db['my_test_collection']

# Define a document to insert
document = {
    "name": "Jane Smith",
    "age": 25,
    "city": "San Francisco",
    "description": "Document inserted from a randomly named script."
}

# Insert the document into the collection
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")
