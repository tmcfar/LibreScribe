# LibriScribe Docker Environment Documentation

## Overview

This document provides comprehensive information about the LibriScribe Docker environment setup, configuration, and usage.

## Table of Contents

1. [Environment Setup](#environment-setup)
2. [Docker Configuration](#docker-configuration)
3. [API Key Configuration](#api-key-configuration)
4. [Usage Instructions](#usage-instructions)
5. [Docker Commands Reference](#docker-commands-reference)
6. [Troubleshooting](#troubleshooting)
7. [Maintenance Procedures](#maintenance-procedures)

## Environment Setup

LibriScribe is deployed in a Docker container with the following components:

- Base image: Python 3.9-slim
- Container name: librescribe-dev
- GitHub repository: https://github.com/guerra2fernando/libriscribe
- Configuration files:
  - Dockerfile: Container definition
  - docker-compose.yml: Service configuration
  - .env: API key storage

The setup provides an isolated environment for running LibriScribe without affecting your system or other projects.

## Docker Configuration

### Dockerfile

```dockerfile
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

# Create a .env file placeholder
RUN touch .env

# Command to keep container running
CMD ["bash"]
