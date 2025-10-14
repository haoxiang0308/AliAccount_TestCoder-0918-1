import random
import string
from pymongo import MongoClient

# --- Configuration ---
MONGO_URI = "mongodb://localhost:27017/"  # Replace with your MongoDB URI
DB_NAME = "test_db"
COLLECTION_NAME = "test_collection"
# ---------------------

def generate_random_filename(length=10):
    """Generates a random filename consisting of letters and numbers."""
    letters_and_digits = string.ascii_letters + string.digits
    return ''.join(random.choice(letters_and_digits) for _ in range(length)) + ".py"

def insert_document_and_save_script():
    """Connects to MongoDB, inserts a document, and saves this script with a random name."""
    client = MongoClient(MONGO_URI)
    db = client[DB_NAME]
    collection = db[COLLECTION_NAME]

    # Document to insert
    document = {
        "name": "John Doe",
        "age": 30,
        "city": "New York"
    }

    # Insert the document
    result = collection.insert_one(document)
    print(f"Document inserted with ID: {result.inserted_id}")

    # Generate a random filename for this script
    random_filename = generate_random_filename()

    # Read the current script content
    with open(__file__, 'r') as f:
        script_content = f.read()

    # Write the script content to the new file with the random name
    with open(random_filename, 'w') as f:
        f.write(script_content)

    print(f"This script has been saved to a new file: {random_filename}")

    # Close the MongoDB connection
    client.close()

if __name__ == "__main__":
    insert_document_and_save_script()
