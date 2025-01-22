#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Run database migrations
python manage.py makemigrations
python manage.py migrate

# Start Gunicorn
exec gunicorn --bind 0.0.0.0:8000 todo_project.wsgi:application
