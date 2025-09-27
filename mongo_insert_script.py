import random
import string
from pymongo import MongoClient

# Connect to MongoDB (assumes a local instance or one configured via environment variables)
# For a real application, use a connection string like "mongodb+srv://<username>:<password>@<cluster-url>/"
client = MongoClient('mongodb://localhost:27017/') 

# Specify the database and collection
db = client['sample_db']
collection = db['sample_collection']

# Create a document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))  # Add a random ID
}

# Insert the document into the collection
result = collection.insert_one(document)

print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection
client.close()
