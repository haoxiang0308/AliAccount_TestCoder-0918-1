import pymongo
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def insert_document():
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
            "name": "John Doe",
            "email": "john.doe@example.com",
            "age": 30,
            "city": "New York",
            "timestamp": pymongo.MongoClient().server_info()['localTime'] if client else None
        }
        
        # Insert the document
        result = collection.insert_one(sample_document)
        print(f"Document inserted with ID: {result.inserted_id}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
        
    except pymongo.errors.ConnectionFailure:
        print("Could not connect to MongoDB. Please ensure MongoDB is running.")
        return None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None

def create_random_script_file():
    """Create a new Python script with random name containing the insert function"""
    random_filename = generate_random_filename()
    
    script_content = f'''import pymongo

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
        sample_document = {{
            "name": "Jane Smith",
            "email": "jane.smith@example.com",
            "age": 25,
            "city": "San Francisco",
            "inserted_from": "{random_filename}"
        }}
        
        # Insert the document
        result = collection.insert_one(sample_document)
        print(f"Document inserted from {random_filename} with ID: {{result.inserted_id}}")
        
        # Close the connection
        client.close()
        
        return result.inserted_id
        
    except pymongo.errors.ConnectionFailure:
        print("Could not connect to MongoDB. Please ensure MongoDB is running.")
        return None
    except Exception as e:
        print(f"An error occurred: {{e}}")
        return None

# Execute the function
if __name__ == "__main__":
    insert_sample_document()
'''

    # Write the script to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(script_content)
    
    print(f"Random script file created: {random_filename}")
    return random_filename

if __name__ == "__main__":
    # First, insert a document using PyMongo
    doc_id = insert_document()
    
    # Then create a new script with random name
    random_file = create_random_script_file()
    
    print(f"Process completed. Document inserted with ID: {doc_id}, Random script created: {random_file}")