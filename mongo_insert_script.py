import random
import string
from pymongo import MongoClient

# --- Configuration ---
# Replace these with your actual MongoDB connection details
MONGO_URI = "mongodb://localhost:27017/"  # Default local URI
DATABASE_NAME = "test_db"
COLLECTION_NAME = "test_collection"

# --- Script Logic ---
def generate_random_filename():
    """Generates a random filename with a .py extension."""
    random_string = ''.join(random.choices(string.ascii_letters, k=10))
    return f"{random_string}.py"

def main():
    # 1. Connect to MongoDB
    client = MongoClient(MONGO_URI)
    db = client[DATABASE_NAME]
    collection = db[COLLECTION_NAME]

    # 2. Create the document to insert
    document = {
        "name": "John Doe",
        "age": 30,
        "city": "New York",
        "random_field": random.randint(1, 100)
    }

    # 3. Insert the document into the collection
    result = collection.insert_one(document)
    print(f"Document inserted with ID: {result.inserted_id}")

    # 4. Generate a random filename
    random_filename = generate_random_filename()
    print(f"Saving script to randomly named file: {random_filename}")

    # 5. Write the script itself to the new file
    script_content = f'''import random
import string
from pymongo import MongoClient

# --- Configuration ---
MONGO_URI = "{MONGO_URI}"
DATABASE_NAME = "{DATABASE_NAME}"
COLLECTION_NAME = "{COLLECTION_NAME}"

def main():
    client = MongoClient(MONGO_URI)
    db = client[DATABASE_NAME]
    collection = db[COLLECTION_NAME]

    document = {{
        "name": "John Doe",
        "age": 30,
        "city": "New York",
        "random_field": random.randint(1, 100)
    }}

    result = collection.insert_one(document)
    print(f"Document inserted with ID: {{result.inserted_id}}")

if __name__ == "__main__":
    main()
'''
    with open(random_filename, 'w') as f:
        f.write(script_content)

    print(f"Script successfully saved to {random_filename}")

    # Close the MongoDB connection
    client.close()

if __name__ == "__main__":
    main()
