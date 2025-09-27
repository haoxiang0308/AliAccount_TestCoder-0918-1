from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional
import uuid

app = FastAPI()

class Item(BaseModel):
    name: str
    description: Optional[str] = None

@app.post("/items/")
async def create_item(item: Item):
    item_id = str(uuid.uuid4())
    return {"id": item_id, "name": item.name, "description": item.description}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)