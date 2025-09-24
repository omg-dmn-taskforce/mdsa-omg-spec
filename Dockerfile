FROM python:3.9-slim

# Install necessary build tools and dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  make \
  git \
  texlive-full \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files (you can adjust this according to your needs)
COPY . .

# Default command
CMD ["make", "debug"]