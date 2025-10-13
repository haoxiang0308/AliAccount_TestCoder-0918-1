import random
from pymongo import MongoClient

# Connect to MongoDB (assumes a local instance or standard cluster)
# Replace the URI if your MongoDB setup is different, e.g., a remote cluster with credentials.
client = MongoClient('mongodb://localhost:27017/') # Or your MongoDB URI

# Access a database (it will be created if it doesn't exist)
db = client['my_test_database']

# Access a collection (it will be created if it doesn't exist)
collection = db['my_test_collection']

# Define a document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_id": random.randint(1000, 9999)  # Add a random number to make each run unique
}

# Insert the document into the collection
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()
