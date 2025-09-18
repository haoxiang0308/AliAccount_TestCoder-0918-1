from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import json
import uuid
import os

app = FastAPI()

# Model for our POST request data
class PostData(BaseModel):
    name: str
    email: str
    message: str

@app.post("/submit")
async def submit_data(data: PostData):
    # Generate a random filename
    filename = f"{uuid.uuid4().hex}.json"
    
    # Save the data to the file
    try:
        with open(filename, "w") as f:
            json.dump(data.dict(), f)
        return {"message": "Data saved successfully", "filename": filename}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error saving data: {str(e)}")

@app.get("/")
async def root():
    return {"message": "FastAPI POST endpoint ready"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)