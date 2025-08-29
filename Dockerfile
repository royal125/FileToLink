# Use a modern, slim Python image
FROM python:3.10-slim

# Set the working directory for the application
WORKDIR /app

# Install git and other dependencies in a single, efficient command
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Copy your requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . .

# Command to run the bot when the container starts
CMD ["python", "bot.py"]
