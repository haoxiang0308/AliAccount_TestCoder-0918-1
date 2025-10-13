import random
import string
from pymongo import MongoClient

# --- Configuration ---
# Replace these with your actual MongoDB connection details
MONGO_URI = "mongodb://localhost:27017/"  # Default local URI
DATABASE_NAME = "my_database"
COLLECTION_NAME = "my_collection"

# Document to insert
document_to_insert = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=8))
}

# --- Execution ---
try:
    # Connect to MongoDB
    client = MongoClient(MONGO_URI)

    # Access the database and collection
    db = client[DATABASE_NAME]
    collection = db[COLLECTION_NAME]

    # Insert the document
    result = collection.insert_one(document_to_insert)

    print(f"Document inserted successfully with ID: {result.inserted_id}")

    # Close the connection
    client.close()

except Exception as e:
    print(f"An error occurred: {e}")
