FROM python:3.9-slim

WORKDIR /app
COPY handler.py .

CMD ["python3", "-m", "wsgiref.simple_server", "0.0.0.0", "8080", "handler:app"]