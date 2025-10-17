import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def create_fastapi_endpoint_file():
    """Create a FastAPI endpoint in a randomly named file"""
    # Generate the FastAPI endpoint code
    fastapi_code = '''from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional
import uuid

app = FastAPI()

class Item(BaseModel):
    name: str
    description: Optional[str] = None
    price: float
    tax: Optional[float] = None

@app.post("/items/")
async def create_item(item: Item):
    """
    A sample POST endpoint that accepts item data and returns it with a generated ID
    """
    item_id = str(uuid.uuid4())
    return {
        "id": item_id,
        "name": item.name,
        "description": item.description,
        "price": item.price,
        "tax": item.tax
    }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
'''
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the code to the randomly named file
    filepath = os.path.join('/workspace', random_filename)
    with open(filepath, 'w') as f:
        f.write(fastapi_code)
    
    print(f"FastAPI endpoint saved to: {filepath}")
    return filepath

if __name__ == "__main__":
    create_fastapi_endpoint_file()