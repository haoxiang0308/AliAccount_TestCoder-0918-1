# Auto-generated script to insert a document into MongoDB
from pymongo import MongoClient

# Connection details (replace with your actual connection string)
MONGO_CONNECTION_STRING = 'mongodb://localhost:27017/'
DATABASE_NAME = 'test_database'
COLLECTION_NAME = 'test_collection'

# Connect
client = MongoClient(MONGO_CONNECTION_STRING)
db = client[DATABASE_NAME]
collection = db[COLLECTION_NAME]

# Document to insert
document = {'name': 'John Doe', 'age': 30, 'city': 'New York', 'random_id': 'bKZtJH'}

# Insert the document
result = collection.insert_one(document)
print(f"Inserted document with ID: {result.inserted_id}")

# Close the connection
client.close()
