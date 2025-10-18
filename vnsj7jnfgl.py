from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional
import uvicorn
import json

app = FastAPI()

# Define a request model
class Item(BaseModel):
    name: str
    description: Optional[str] = None
    price: float
    tax: Optional[float] = None

# POST endpoint
@app.post("/items/")
async def create_item(item: Item):
    """
    Accepts a POST request with item data and returns the received data
    """
    item_dict = item.dict()
    if item.tax:
        price_with_tax = item.price + item.tax
        item_dict.update({"price_with_tax": price_with_tax})
    
    return {
        "message": "Item received successfully",
        "item": item_dict
    }

# Health check endpoint
@app.get("/health")
async def health_check():
    return {"status": "healthy"}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)