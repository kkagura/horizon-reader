#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IMAGE_NAME="${IMAGE_NAME:-horizon-reader/web:latest}"
IMAGE_TAR="${IMAGE_TAR:-${BASE_DIR}/reader-image.tar}"
CONTAINER_NAME="${CONTAINER_NAME:-horizon-reader-web}"
HOST_PORT="${HOST_PORT:-9991}"
REPORTS_DIR="${REPORTS_DIR:-/opt/horizon-deploy/reports}"

if [ ! -d "${REPORTS_DIR}" ]; then
  echo "Reports directory does not exist: ${REPORTS_DIR}" >&2
  exit 1
fi

if [ -f "${IMAGE_TAR}" ]; then
  echo "Loading Docker image from ${IMAGE_TAR}..."
  docker load -i "${IMAGE_TAR}"
elif ! docker image inspect "${IMAGE_NAME}" >/dev/null 2>&1; then
  echo "Docker image not found locally and tar file is missing: ${IMAGE_TAR}" >&2
  exit 1
fi

if docker ps -a --format '{{.Names}}' | grep -Fxq "${CONTAINER_NAME}"; then
  echo "Removing existing container: ${CONTAINER_NAME}"
  docker rm -f "${CONTAINER_NAME}" >/dev/null
fi

echo "Starting ${CONTAINER_NAME} on port ${HOST_PORT}..."
docker run -d \
  --name "${CONTAINER_NAME}" \
  --restart unless-stopped \
  -p "${HOST_PORT}:3000" \
  -e NUXT_REPORTS_DIR=/app/reports \
  -e REPORTS_DIR=/app/reports \
  -v "${REPORTS_DIR}:/app/reports:ro" \
  "${IMAGE_NAME}"

echo "Done."
echo "Open: http://SERVER_IP:${HOST_PORT}"
