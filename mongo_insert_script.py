import random
import string
from pymongo import MongoClient

# Connect to MongoDB (assumes a local instance or adjust the URI)
client = MongoClient('mongodb://localhost:27017/')
db = client['test_database']
collection = db['test_collection']

# Create a sample document
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))
}

# Insert the document
result = collection.insert_one(document)
print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()