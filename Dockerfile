FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Default port Render provides is 10000, but it's injected as $PORT at runtime
# EXPOSE 10000   # (optional, safe to omit)

# Start with gunicorn, binding to Render's $PORT
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app

