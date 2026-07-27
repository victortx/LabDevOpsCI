#!/bin/bash

set -e

echo "Stopping Docker Compose stack..."

docker compose down -v

echo "Docker Compose stack stopped."
