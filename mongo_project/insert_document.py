import random
from pymongo import MongoClient

# Connect to MongoDB (assumes a local instance or standard cluster URI)
# Replace the URI below with your actual MongoDB connection string if different.
client = MongoClient('mongodb://localhost:27017/') # Or your connection URI

# Access a database (creates it if it doesn't exist)
db = client['my_database']

# Access a collection (creates it if it doesn't exist)
collection = db['my_collection']

# Define a document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_id": random.randint(1000, 9999)  # Add a random number for uniqueness
}

# Insert the document into the collection
result = collection.insert_one(document)

# Print the ID of the inserted document
print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection (optional, as it's often handled by the application lifecycle)
client.close()
