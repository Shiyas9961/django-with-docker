# Use Python Official Image
FROM python:3.10-slim

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