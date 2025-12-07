FROM ubuntu:22.04
RUN apt-get update && apt-get install -y git curl ca-certificates && rm -rf /var/lib/apt/lists/*
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - && apt-get install -y nodejs && npm install -g @mockoon/cli
WORKDIR /app
ARG REPO_URL
RUN git clone $REPO_URL repo
ENV MOCK_FILE=/app/repo/mockoon-data.json
ENV PORT=3000
EXPOSE 3000
CMD ["mockoon-cli", "start", "--data", "/app/repo/mockoon-data.json", "--port", "3000"]