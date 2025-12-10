FROM python:3.13.6-bullseye

RUN pip install --no-input fastapi uvicorn
WORKDIR /app
COPY ./src/* .
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
