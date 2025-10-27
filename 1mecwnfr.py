from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.post('/data')
async def create_item(data: dict):
    # Process the received data
    return {'message': 'Data received successfully', 'received_data': data}

if __name__ == '__main__':
    uvicorn.run(app, host='0.0.0.0', port=8000)
