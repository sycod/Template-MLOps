"""FastAPI blueprint"""

from fastapi import FastAPI
import uvicorn


app = FastAPI()


@app.get("/")
async def root():
    """Simple print function"""
    return {"message": "Hi Dude"}

@app.get("/add/{num1}/{num2}")
async def add(num1: int, num2: int):
    """Add two integers"""

    total = num1 + num2
    return {"total": total}

if __name__ == "__main__":
    uvicorn.run(app, port=8080, host='127.0.0.1')
