import random
import string
from pymongo import MongoClient

# --- Configuration ---
MONGO_URI = "mongodb://localhost:27017/"  # Adjust if your MongoDB is elsewhere
DATABASE_NAME = "test_db"
COLLECTION_NAME = "test_collection"

def generate_random_filename(length=10):
    """Generates a random filename consisting of letters and digits."""
    letters_and_digits = string.ascii_letters + string.digits
    return ''.join(random.choice(letters_and_digits) for _ in range(length)) + ".py"

def insert_document_and_save_script():
    """Connects to MongoDB, inserts a document, and saves this script with a random name."""
    try:
        # 1. Connect to MongoDB
        client = MongoClient(MONGO_URI)
        db = client[DATABASE_NAME]
        collection = db[COLLECTION_NAME]

        # 2. Create the document to insert
        document = {
            "name": "John Doe",
            "age": 30,
            "city": "New York",
            "timestamp": "2023-10-27T10:00:00Z"  # Example timestamp
        }

        # 3. Insert the document
        result = collection.insert_one(document)
        print(f"Document inserted with ID: {result.inserted_id}")

        # 4. Save this script with a random name
        random_filename = generate_random_filename()
        with open(random_filename, 'w') as f:
            f.write('''import random
import string
from pymongo import MongoClient

# --- Configuration ---
MONGO_URI = "mongodb://localhost:27017/"  # Adjust if your MongoDB is elsewhere
DATABASE_NAME = "test_db"
COLLECTION_NAME = "test_collection"

def generate_random_filename(length=10):
    \"\"\"Generates a random filename consisting of letters and digits.\"\"\"
    letters_and_digits = string.ascii_letters + string.digits
    return ''.join(random.choice(letters_and_digits) for _ in range(length)) + ".py"

def insert_document_and_save_script():
    \"\"\"Connects to MongoDB, inserts a document, and saves this script with a random name.\"\"\"
    try:
        # 1. Connect to MongoDB
        client = MongoClient(MONGO_URI)
        db = client[DATABASE_NAME]
        collection = db[COLLECTION_NAME]

        # 2. Create the document to insert
        document = {
            "name": "John Doe",
            "age": 30,
            "city": "New York",
            "timestamp": "2023-10-27T10:00:00Z"  # Example timestamp
        }

        # 3. Insert the document
        result = collection.insert_one(document)
        print(f"Document inserted with ID: {result.inserted_id}")

        # 4. Save this script with a random name
        random_filename = generate_random_filename()
        with open(random_filename, 'w') as f:
            f.write("<THIS_SCRIPT_CONTENT_WOULD_BE_HERE>")
        print(f"Original script saved as: {random_filename}")

    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        # 5. Close the connection
        client.close()

if __name__ == "__main__":
    insert_document_and_save_script()
''')
        print(f"Original script saved as: {random_filename}")

    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        # 5. Close the connection
        client.close()

if __name__ == "__main__":
    insert_document_and_save_script()
