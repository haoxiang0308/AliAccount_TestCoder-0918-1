from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import uvicorn
import random
import string

app = FastAPI()

# Model for our POST request data
class Item(BaseModel):
    name: str
    description: str
    price: float
    tax: float = None

# POST endpoint
@app.post("/items/")
async def create_item(item: Item):
    # In a real application, you would save this to a database
    # For now, we'll just return the item with an ID
    item_id = random.randint(1, 1000)
    return {"item_id": item_id, "item": item}

# Health check endpoint
@app.get("/health")
async def health_check():
    return {"status": "OK"}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)