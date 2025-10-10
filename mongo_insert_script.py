import random
import string
from pymongo import MongoClient

# --- Configuration ---
MONGO_URI = "mongodb://localhost:27017/"  # Update this URI if your MongoDB instance is elsewhere
DATABASE_NAME = "test_database"
COLLECTION_NAME = "test_collection"

def generate_random_filename(length=10):
    """Generates a random filename with a .py extension."""
    letters = string.ascii_lowercase
    random_part = ''.join(random.choice(letters) for i in range(length))
    return f"{random_part}.py"

def insert_document_and_save_script():
    """Connects to MongoDB, inserts a document, and saves this script with a random name."""
    try:
        # Connect to MongoDB
        client = MongoClient(MONGO_URI)
        db = client[DATABASE_NAME]
        collection = db[COLLECTION_NAME]

        # Document to insert
        document = {
            "name": "John Doe",
            "age": 30,
            "city": "New York",
            "inserted_at": "2025-10-10T10:00:00Z"
        }

        # Insert the document
        result = collection.insert_one(document)
        print(f"Document inserted with ID: {result.inserted_id}")

        # Generate a random filename for this script
        random_filename = generate_random_filename()

        # Read the current script's content
        with open(__file__, 'r') as source_file:
            script_content = source_file.read()

        # Write the content to the new file with the random name
        with open(random_filename, 'w') as new_file:
            new_file.write(script_content)

        print(f"Script successfully saved as {random_filename}")

        # Close the MongoDB connection
        client.close()

    except Exception as e:
        print(f"An error occurred during database operation: {e}")
        # Even if the DB operation fails, we still want to save the script with a random name.
        # Generate a random filename for this script
        random_filename = generate_random_filename()

        # Read the current script's content
        with open(__file__, 'r') as source_file:
            script_content = source_file.read()

        # Write the content to the new file with the random name
        with open(random_filename, 'w') as new_file:
            new_file.write(script_content)

        print(f"Script successfully saved as {random_filename}")

if __name__ == "__main__":
    insert_document_and_save_script()
