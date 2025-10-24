from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Optional
import uuid
import json

app = FastAPI()

# Define a request model
class PostRequest(BaseModel):
    name: str
    email: str
    message: Optional[str] = None

@app.post("/data")
async def create_item(request: PostRequest):
    """
    A POST endpoint that accepts data and returns a confirmation with a unique ID
    """
    # Generate a unique ID for this request
    unique_id = str(uuid.uuid4())
    
    # Process the data (in this example, we'll just return it)
    response_data = {
        "id": unique_id,
        "name": request.name,
        "email": request.email,
        "message": request.message,
        "status": "received"
    }
    
    # Here you could save to a database, file, etc.
    print(f"Received POST data: {response_data}")
    
    return response_data

# Health check endpoint
@app.get("/")
def read_root():
    return {"message": "FastAPI POST endpoint is running!"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)