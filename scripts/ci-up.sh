#!/bin/bash

set -e

echo "Creating CI environment file..."

cat > .env <<EOF
PORT=3000
DB_HOST=postgres
DB_PORT=5432
DB_NAME=devops_lab
DB_USER=devops_user
DB_PASSWORD=devops_password
EOF

echo "Building and starting Docker Compose stack..."

docker compose up -d --build

echo "Docker Compose stack started."

docker compose ps
