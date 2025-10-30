import pymongo

def insert_sample_document():
    """Connect to MongoDB and insert a sample document"""
    try:
        # Connect to MongoDB (assuming default localhost connection)
        client = pymongo.MongoClient("mongodb://localhost:27017/")
        
        # Create/access database
        db = client["sample_db"]
        
        # Create/access collection
        collection = db["sample_collection"]
        
        # Document to insert
        sample_document = {
            "name": "Jane Smith",
            "email": "jane.smith@example.com",
            "age": 25,
            "city": "San Francisco",
            "inserted_from": "ovffl96ytr.py"
        }
        
        # Insert the document
        result = collection.insert_one(sample_document)
        print(f"Document inserted from ovffl96ytr.py with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
        
    except pymongo.errors.ConnectionFailure:
        print("Could not connect to MongoDB. Please ensure MongoDB is running.")
        return None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None

# Execute the function
if __name__ == "__main__":
    insert_sample_document()
