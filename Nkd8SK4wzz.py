from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import uvicorn
import random
import string

app = FastAPI()

# Define a model for our POST request data
class Item(BaseModel):
    name: str
    description: str
    price: float
    tax: float = None

# POST endpoint
@app.post("/items/")
async def create_item(item: Item):
    # Simulate processing the item
    item_dict = item.dict()
    if item.tax:
        price_with_tax = item.price + item.tax
        item_dict.update({"price_with_tax": price_with_tax})
    
    # Return the processed item
    return {
        "message": "Item created successfully",
        "item": item_dict,
        "item_id": "".join(random.choices(string.ascii_letters + string.digits, k=8))
    }

# Health check endpoint
@app.get("/health")
async def health_check():
    return {"status": "healthy"}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)