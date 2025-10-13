from fastapi import FastAPI

app = FastAPI()

@app.post("/items/")
async def create_item(name: str, description: str = None):
    return {"name": name, "description": description}