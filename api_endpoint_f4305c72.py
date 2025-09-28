from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.post("/data")
async def receive_data(item: dict):
    # Process the received data here
    print(f"Received data: {item}")
    # For example, save to a file or database
    with open("received_data.json", "w") as f:
        import json
        json.dump(item, f)
    return {"message": "Data received successfully", "received_item": item}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
