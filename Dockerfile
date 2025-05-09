# Use the official Python image as the base image
FROM python:3.13-alpine

# Set the working directory in the container
WORKDIR /app

# Install the required packages
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY pysubstitutor/ /app/pysubstitutor/
COPY data/ /app/data/

# Copy the tests into the container
COPY tests/ /app/tests/

# Set the PYTHONPATH environment variable
ENV PYTHONPATH=/app

# Explicitly set the entrypoint
ENTRYPOINT ["python", "-m", "pysubstitutor"]
