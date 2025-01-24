#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Log the start of the script
echo "Starting entrypoint.sh..."

echo "Loading environment variables..."
source local.sh

echo "Waiting for PostgreSQL to be ready..."
while ! nc -z db 5432; do
  sleep 1
done
echo "PostgreSQL is ready!"

# Run database migrations
echo "Running database migrations..."
python manage.py makemigrations
python manage.py migrate

# Start Gunicorn
echo "Starting Gunicorn server..."
exec gunicorn --bind 0.0.0.0:8000 todo_project.wsgi:application
