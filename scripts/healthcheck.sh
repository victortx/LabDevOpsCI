#!/bin/bash

set -e

echo "Waiting for API healthcheck..."

for i in {1..20}; do
  if curl -f http://localhost/health; then
    echo ""
    echo "API is healthy."
    exit 0
  fi

  echo "Waiting for API... attempt $i/20"
  sleep 5
done

echo "API did not become healthy."
docker compose logs
exit 1
