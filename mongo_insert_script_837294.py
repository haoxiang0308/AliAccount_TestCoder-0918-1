import random
from pymongo import MongoClient

# Connect to MongoDB (assumes a local instance or default connection string)
client = MongoClient('mongodb://localhost:27017/')

# Access a database (creates it if it doesn't exist)
db = client['my_database']

# Access a collection (creates it if it doesn't exist)
collection = db['my_collection']

# Create a document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_id": random.randint(1000, 9999)
}

# Insert the document into the collection
result = collection.insert_one(document)

# Print the ID of the inserted document
print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()
