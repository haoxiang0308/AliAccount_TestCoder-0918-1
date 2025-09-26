from fastapi import FastAPI
import uuid

app = FastAPI()

@app.post("/data")
async def receive_data():
    # Generate a random filename
    random_filename = f"data_{uuid.uuid4().hex}.py"
    
    # Example content to save (a simple print statement)
    content_to_save = 'print("Hello from a randomly named file!")\n'
    
    # Write the content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(content_to_save)
    
    return {"message": f"Data saved successfully to {random_filename}", "filename": random_filename}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)