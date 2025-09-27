from fastapi import FastAPI
import uuid

app = FastAPI()

@app.post("/data/")
async def receive_data():
    # Generate a random filename
    random_filename = f"{uuid.uuid4()}.py"
    
    # Example content for the file (a simple print statement)
    file_content = 'print("Hello from the randomly named file!")\n'
    
    # Write the content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(file_content)
    
    return {"message": "POST request received and file saved", "filename": random_filename}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)