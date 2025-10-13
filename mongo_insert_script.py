import pymongo
import random
import string

# Generate a random filename for the script itself
random_script_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# MongoDB connection details (assuming local MongoDB instance)
client = pymongo.MongoClient("mongodb://localhost:27017/")
db = client["test_database"]
collection = db["test_collection"]

# Document to insert
document = {
    "name": "John Doe",
    "age": 30,
    "city": "New York",
    "random_script_name": random_script_name
}

# Insert the document
result = collection.insert_one(document)
print(f"Document inserted with ID: {result.inserted_id}")

# Save this script with a random name
with open(random_script_name, 'w') as f:
    f.write('# This script was saved with a random name\n')
    f.write('# It inserts a document into MongoDB using PyMongo\n')
    f.write('# The document includes the name of this randomly generated file\n\n')
    f.write('# Connection and insertion code\n')
    f.write('import pymongo\n')
    f.write('client = pymongo.MongoClient("mongodb://localhost:27017/")\n')
    f.write('db = client["test_database"]\n')
    f.write('collection = db["test_collection"]\n')
    f.write(f'document = {document}\n')
    f.write('result = collection.insert_one(document)\n')
    f.write('print(f"Document inserted with ID: {result.inserted_id}")\n')

print(f"This script was saved as: {random_script_name}")
