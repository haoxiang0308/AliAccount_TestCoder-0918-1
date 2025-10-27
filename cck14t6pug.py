from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional
import uuid

app = FastAPI()

# Define a request model
class Item(BaseModel):
    name: str
    description: Optional[str] = None
    price: float

# Define a response model
class ItemResponse(BaseModel):
    id: str
    name: str
    description: Optional[str] = None
    price: float
    message: str = "Item received successfully"

@app.post("/items/", response_model=ItemResponse)
async def create_item(item: Item):
    """
    POST endpoint that accepts item data and returns it with a generated ID
    """
    # Generate a random ID for the item
    item_id = str(uuid.uuid4())
    
    # Create response object
    response = ItemResponse(
        id=item_id,
        name=item.name,
        description=item.description,
        price=item.price
    )
    
    return response

# Health check endpoint
@app.get("/health")
async def health_check():
    return {"status": "healthy"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)