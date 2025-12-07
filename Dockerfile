FROM ubuntu:22.04

# نصب وابستگی‌ها
RUN apt-get update && apt-get install -y curl ca-certificates git build-essential && rm -rf /var/lib/apt/lists/*

# نصب Node.js 20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && node -v \
    && npm -v

# نصب Mockoon CLI
RUN npm install -g @mockoon/cli

WORKDIR /app

COPY . .

ENV MOCK_FILE=/app/mockoon-data.json
ENV PORT=3000

EXPOSE 3000

CMD ["mockoon-cli", "start", "--data", "/app/mockoon-data.json", "--port", "3000"]