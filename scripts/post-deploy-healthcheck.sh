#!/bin/bash

set -euo pipefail

HEALTH_URL="${HEALTH_URL:-http://localhost/health}"
MAX_ATTEMPTS="${MAX_ATTEMPTS:-20}"
SLEEP_SECONDS="${SLEEP_SECONDS:-5}"

echo "Running post-deploy healthcheck..."
echo "Health URL: $HEALTH_URL"

for i in $(seq 1 "$MAX_ATTEMPTS"); do
  if curl -fsS "$HEALTH_URL"; then
    echo ""
    echo "Post-deploy healthcheck passed."
    exit 0
  fi

  echo "Waiting for application... attempt $i/$MAX_ATTEMPTS"
  sleep "$SLEEP_SECONDS"
done

echo "Post-deploy healthcheck failed."
docker compose logs
exit 1
