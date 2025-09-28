import random
import string
from pymongo import MongoClient

# --- Configuration ---
MONGO_URI = "mongodb://localhost:27017/"  # Replace with your MongoDB URI
DB_NAME = "test_database"
COLLECTION_NAME = "test_collection"

def generate_random_filename(length=10):
    """Generates a random filename with a .py extension."""
    letters = string.ascii_lowercase + string.digits
    random_part = ''.join(random.choice(letters) for i in range(length))
    return f"{random_part}.py"

def insert_document_and_save_script():
    """Connects to MongoDB, inserts a document, and saves this script with a random name."""
    try:
        # Connect to MongoDB
        client = MongoClient(MONGO_URI)
        db = client[DB_NAME]
        collection = db[COLLECTION_NAME]

        # Document to insert
        document = {
            "name": "John Doe",
            "age": 30,
            "city": "New York",
            "inserted_at": "2023-10-27T10:00:00Z"
        }

        # Insert the document
        result = collection.insert_one(document)
        print(f"Document inserted with ID: {result.inserted_id}")

        # Generate a random filename
        random_filename = generate_random_filename()

        # Save this script to the randomly named file
        with open(__file__, 'r') as source_file:
            script_content = source_file.read()

        with open(random_filename, 'w') as new_file:
            new_file.write(script_content)

        print(f"This script has been saved to the file: {random_filename}")

    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        # Close the MongoDB connection
        if 'client' in locals():
            client.close()
            print("MongoDB connection closed.")

if __name__ == "__main__":
    insert_document_and_save_script()
