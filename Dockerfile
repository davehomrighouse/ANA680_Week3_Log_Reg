# Python base image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Install dependencies first (helps with caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your Flask app code
COPY . .

# Flask settings
ENV FLASK_APP=wine_quality_lr_app:app \
    FLASK_RUN_HOST=0.0.0.0

# Expose Flask’s default port
EXPOSE 5000

# Start the server (flask run)
CMD ["python", "-m", "flask", "run", "--port", "5000"]