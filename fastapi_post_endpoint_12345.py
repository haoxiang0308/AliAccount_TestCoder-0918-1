from fastapi import FastAPI
import uvicorn
import random
import string

app = FastAPI()

@app.post("/data")
async def receive_post_data(item: dict):
    """
    A POST endpoint that receives data and returns a confirmation
    """
    # Process the received data (in this case just echoing it back)
    response_data = {
        "received_data": item,
        "status": "success",
        "message": "Data received successfully"
    }
    return response_data

@app.get("/")
async def root():
    return {"message": "FastAPI POST endpoint is running!"}

if __name__ == "__main__":
    # Generate a random port for running the server
    random_port = random.randint(8000, 9999)
    print(f"Starting server on random port: {random_port}")
    uvicorn.run(app, host="0.0.0.0", port=random_port)