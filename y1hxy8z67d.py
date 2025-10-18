import pymongo
import random
import string

# Connect to MongoDB (assuming local installation with default settings)
try:
    client = pymongo.MongoClient("mongodb://localhost:27017/")
    
    # Create/access a database
    db = client["sample_database"]
    
    # Create/access a collection
    collection = db["sample_collection"]
    
    # Create a sample document to insert
    sample_document = {
        "name": "John Doe",
        "email": "john.doe@example.com",
        "age": 30,
        "city": "New York",
        "date_created": "2023-01-01",
        "random_id": ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    }
    
    # Insert the document
    result = collection.insert_one(sample_document)
    print(f"Document inserted with ID: {result.inserted_id}")
    
    # Verify the document was inserted
    retrieved_doc = collection.find_one({"_id": result.inserted_id})
    print(f"Retrieved document: {retrieved_doc}")
    
except pymongo.errors.ConnectionFailure:
    print("Could not connect to MongoDB. Please make sure MongoDB is running.")
except Exception as e:
    print(f"An error occurred: {e}")
finally:
    if 'client' in locals():
        client.close()
