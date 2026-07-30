#!/bin/bash

set -euo pipefail

echo "Starting local deployment..."

if [ ! -f ".env" ]; then
  echo "ERROR: .env file not found."
  echo "Create a .env file based on .env.example before deploying."
  exit 1
fi

echo "Validating Docker Compose configuration..."
docker compose config > /dev/null

echo "Building and starting Docker Compose stack..."
docker compose up -d --build

echo "Current containers:"
docker compose ps

echo "Running post-deploy validation..."
./scripts/post-deploy-healthcheck.sh

echo "Deployment completed successfully."
