from fastapi import FastAPI
import uvicorn
from pydantic import BaseModel
from typing import Optional
import random
import string

app = FastAPI()

class Item(BaseModel):
    name: str
    description: Optional[str] = None
    price: float
    tax: Optional[float] = None

@app.post("/items/")
async def create_item(item: Item):
    """
    A sample POST endpoint that receives item data and returns it with an ID
    """
    item_id = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    return {
        "id": item_id,
        "name": item.name,
        "description": item.description,
        "price": item.price,
        "tax": item.tax,
        "message": "Item created successfully"
    }

# This allows running the file directly with uvicorn for testing
if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)