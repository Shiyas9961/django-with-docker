# Use Python Official Image
FROM python:3.10-slim

# Install Dependencies
RUN apt-get update && apt-get install -y netcat-openbsd && rm -rf /var/lib/apt/lists/*

# Set Working Directory
WORKDIR /app

# Install Dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy Project Files
COPY . .

# Expose Port
EXPOSE 8000

# Copy the entrypoint script
COPY entrypoint.sh /app/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]