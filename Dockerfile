FROM python:3.11-slim

WORKDIR /app

# Copying requirements first is a "DevOps Best Practice" for faster builds
COPY app.py .

RUN pip install --no-cache-dir flask

EXPOSE 5000

# Fix: Added the space here
CMD ["python", "app.py"]