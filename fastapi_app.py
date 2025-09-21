from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import uuid
import json
import os

app = FastAPI()

# Model for our POST request data
class PostData(BaseModel):
    name: str
    email: str
    message: str

# POST endpoint
@app.post("/submit")
async def submit_data(data: PostData):
    # Generate a random filename
    filename = f"{uuid.uuid4().hex}.json"
    
    # Save data to file
    try:
        with open(filename, "w") as f:
            json.dump(data.dict(), f)
        return {"message": "Data saved successfully", "filename": filename}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error saving data: {str(e)}")

# Health check endpoint
@app.get("/health")
async def health_check():
    return {"status": "OK"}