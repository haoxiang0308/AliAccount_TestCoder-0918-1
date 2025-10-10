import random
import string
from pymongo import MongoClient

# --- Configuration ---
# Replace with your MongoDB connection string.
# For a local instance, the default is usually 'mongodb://localhost:27017/'
MONGO_CONNECTION_STRING = 'mongodb://localhost:27017/'
DATABASE_NAME = 'test_database'
COLLECTION_NAME = 'test_collection'

def connect_to_mongo():
    """Connects to MongoDB and returns the client, database, and collection objects."""
    client = MongoClient(MONGO_CONNECTION_STRING)
    db = client[DATABASE_NAME]
    collection = db[COLLECTION_NAME]
    return client, db, collection

def generate_random_filename():
    """Generates a random filename with a .py extension."""
    random_suffix = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"insert_document_{random_suffix}.py"

def main():
    # 1. Generate a random Python script name
    script_filename = generate_random_filename()

    # 2. Create a sample document to insert
    document_to_insert = {
        "name": "John Doe",
        "age": 30,
        "city": "New York",
        "random_id": ''.join(random.choices(string.ascii_letters + string.digits, k=6))
    }

    # 3. Create the Python script content that would perform the insert
    script_content = f'''# Auto-generated script to insert a document into MongoDB
from pymongo import MongoClient

# Connection details (replace with your actual connection string)
MONGO_CONNECTION_STRING = '{MONGO_CONNECTION_STRING}'
DATABASE_NAME = '{DATABASE_NAME}'
COLLECTION_NAME = '{COLLECTION_NAME}'

# Connect
client = MongoClient(MONGO_CONNECTION_STRING)
db = client[DATABASE_NAME]
collection = db[COLLECTION_NAME]

# Document to insert
document = {document_to_insert}

# Insert the document
result = collection.insert_one(document)
print(f"Inserted document with ID: {{result.inserted_id}}")

# Close the connection
client.close()
'''

    # 4. Write the script content to the randomly named file
    with open(script_filename, 'w') as f:
        f.write(script_content)

    print(f"Python script created: {script_filename}")
    print("Note: The script contains a MongoDB connection and will fail if run without a local MongoDB instance.")


if __name__ == "__main__":
    main()
