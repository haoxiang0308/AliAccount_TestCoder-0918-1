import random
import string
from pymongo import MongoClient

# Connect to MongoDB (assumes a local instance or standard connection string)
client = MongoClient('mongodb://localhost:27017/')

# Access a database (creates it if it doesn't exist)
db = client['my_test_database']

# Access a collection (creates it if it doesn't exist)
collection = db['my_test_collection']

# Generate a random string for the filename
random_filename = 'script_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Define a document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_file_associated": random_filename
}

try:
    # Insert the document into the collection
    result = collection.insert_one(document)

    print(f"Document inserted with ID: {result.inserted_id}")
    print(f"Associated random filename: {random_filename}")

except Exception as e:
    print(f"Could not insert document. Error: {e}")
    print("This is likely because a MongoDB server is not running at 'localhost:27017'.")
    print(f"Generated random filename: {random_filename}")

# Optionally, save this script with the random name
# This part writes the current script's logic to a new file with the random name
# For demonstration, we'll just print the name instead of creating another file.
# To create the file, uncomment the following lines:
# with open(random_filename, 'w') as f:
#     f.write('# This is a dynamically named script based on the inserted document\\n')
#     f.write(f'# Generated filename: {random_filename}\\n\\n')
#     f.write('# PyMongo logic here... (as above)\\n')
