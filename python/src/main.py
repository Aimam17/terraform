import os

from fastapi import FastAPI


app = FastAPI()
greeting_message = os.environ["GREETING_MESSAGE"]


@app.get("/ping")
async def ping():
    return {"message": "pong"}

@app.get("/greeting")
async def greeting():
    return {"message": greeting_message}
