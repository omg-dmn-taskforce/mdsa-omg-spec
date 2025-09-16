FROM python:3.9-slim

# Install necessary build tools and dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  make \
  git \
  texlive \
  latexmk \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN tlmgr init-usertree
RUN tlmgr install enumitem everypage svg transparent draftwatermark

# Set working directory
WORKDIR /app

# Copy project files (you can adjust this according to your needs)
COPY . .

# Default command
CMD ["make"]