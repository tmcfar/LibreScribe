FROM python:3.9-slim

WORKDIR /app

# Install git and other dependencies
RUN apt-get update && \
    apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Clone the LibriScribe repository
RUN git clone https://github.com/guerra2fernando/libriscribe.git /app

# Install LibriScribe and its dependencies
RUN pip install -e .
RUN pip install anthropic openai google-generativeai deepseek-ai mistralai

# Install linting tools
RUN pip install flake8 black isort mypy pylint

# Create a .env file placeholder
RUN touch .env

# Command to keep container running
CMD ["bash"]
