FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    chromium-driver chromium \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV PATH="/usr/lib/chromium/:$PATH"
ENV CHROME_BIN=/usr/lib/chromium/chromium

CMD ["pytest"]
