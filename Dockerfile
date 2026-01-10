FROM python:3.9-slim

WORKDIR /app

ENV PYTHONUNBUFFERED=1
ENV FLASK_ENV=production
ENV FLASK_APP=app.py

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 10000

CMD ["sh", "-c", "gunicorn -w 4 -b 0.0.0.0:${PORT:-10000} app:app"]
