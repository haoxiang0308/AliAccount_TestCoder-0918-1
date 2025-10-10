import random
import string
from pymongo import MongoClient

# --- Configuration ---
# Replace these with your actual MongoDB connection details
MONGO_URI = "mongodb://localhost:27017/"  # Default local URI
DATABASE_NAME = "test_db"
COLLECTION_NAME = "test_collection"

# --- Main Script ---
def main():
    # Connect to MongoDB
    client = MongoClient(MONGO_URI)
    db = client[DATABASE_NAME]
    collection = db[COLLECTION_NAME]

    # Generate a random document ID for uniqueness
    random_id = ''.join(random.choices(string.ascii_letters + string.digits, k=8))

    # Document to insert
    document = {
        "random_id": random_id,
        "name": "John Doe",
        "age": 30,
        "city": "New York"
    }

    print(f"Inserting document: {document}")

    # Insert the document
    result = collection.insert_one(document)

    print(f"Document inserted with ID: {result.inserted_id}")

    # Close the connection
    client.close()
    print("Connection closed.")

if __name__ == "__main__":
    main()
