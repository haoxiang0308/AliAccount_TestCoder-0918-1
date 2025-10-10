from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.post("/data")
async def receive_post(request_data: dict):
    """
    A FastAPI endpoint that accepts a POST request.
    The request body is expected to be a JSON object.
    """
    # Process the received data here
    # For now, just return it back
    return {"received_data": request_data}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
