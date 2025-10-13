from fastapi import FastAPI
import uuid

app = FastAPI()

@app.post("/data/")
async def receive_data():
    # Generate a random filename
    filename = f"random_file_{uuid.uuid4().hex}.py"
    
    # Content to write to the file
    content = '''# This is a randomly generated Python file.
print("Hello from the randomly named file!")'''

    # Write the content to the file
    with open(filename, 'w') as f:
        f.write(content)
    
    return {"message": f"Data saved successfully to {filename}"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)