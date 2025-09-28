from fastapi import FastAPI
import uuid

app = FastAPI()

@app.post("/data/")
async def receive_data():
    # Generate a random filename
    random_filename = f"file_{uuid.uuid4().hex}.py"
    
    # Example content for the new file
    file_content = '''
# This is a randomly generated file
print("Hello from the randomly named file!")
'''
    
    # Write the content to the new file
    with open(random_filename, 'w') as f:
        f.write(file_content)
    
    return {"message": f"File '{random_filename}' created successfully!"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)