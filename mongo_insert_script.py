import random
from pymongo import MongoClient

# Connect to MongoDB (replace with your connection string)
client = MongoClient('mongodb://localhost:27017/')  # Example connection string
db = client['test_database']
collection = db['test_collection']

# Create a sample document
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_id": random.randint(1000, 9999)  # Add a random ID to make each run unique
}

# Insert the document
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()
