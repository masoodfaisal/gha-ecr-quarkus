from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get("/")
async def read_root():
    return {"Hello": "World"}

# Optional: Add more endpoints
@app.get("/hello/{name}")
async def read_hello(name: str):
    return {"message": f"Hello, {name}!"}


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
