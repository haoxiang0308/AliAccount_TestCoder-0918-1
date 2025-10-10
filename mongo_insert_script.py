import pymongo
import random
import string

# Connect to MongoDB (assumes MongoDB is running locally on default port 27017)
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Access a database (creates it if it doesn't exist)
db = client["my_test_database"]

# Access a collection (creates it if it doesn't exist)
collection = db["my_test_collection"]

# Generate a random string for the document name
random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))

# Define the document to insert
document = {
    "name": random_name,
    "value": 42,
    "description": "A sample document inserted by PyMongo"
}

# Insert the document into the collection
result = collection.insert_one(document)

# Print the ID of the inserted document
print(f"Document inserted with ID: {result.inserted_id}")

# Close the connection (optional, as it will close when the script ends)
client.close()
