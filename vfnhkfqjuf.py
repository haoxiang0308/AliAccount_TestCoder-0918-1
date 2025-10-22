from fastapi import FastAPI
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
    A sample POST endpoint that accepts item data and returns the created item with an ID
    """
    item_id = str(uuid.uuid4())
    return {
        "id": item_id,
        "name": item.name,
        "description": item.description,
        "price": item.price,
        "tax": item.tax,
        "message": "Item created successfully"
    }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)