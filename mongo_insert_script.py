import random
import string
from pymongo import MongoClient

# Connect to MongoDB (assumes a local instance or default settings)
client = MongoClient('mongodb://localhost:27017/')

# Access a database (creates it if it doesn't exist)
db = client['sample_db']

# Access a collection (creates it if it doesn't exist)
collection = db['sample_collection']

# Generate a random string for the document's 'id' field to ensure uniqueness for this example
random_id = ''.join(random.choices(string.ascii_letters + string.digits, k=8))

# Define the document to insert
document = {
    "id": random_id,
    "name": "Sample Document",
    "value": 123,
    "description": "This is a sample document inserted by a PyMongo script."
}

# Insert the document into the collection
result = collection.insert_one(document)

# Print the ID of the inserted document
print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()
