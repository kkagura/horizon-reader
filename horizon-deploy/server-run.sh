#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IMAGE_NAME="${IMAGE_NAME:-horizon-reader/horizon:latest}"
IMAGE_TAR="${IMAGE_TAR:-${BASE_DIR}/horizon-image.tar}"
DATA_DIR="${DATA_DIR:-${BASE_DIR}/data}"
REPORTS_DIR="${REPORTS_DIR:-${BASE_DIR}/reports}"
HOURS="${HOURS:-24}"

mkdir -p "${DATA_DIR}" "${REPORTS_DIR}"

if [ ! -f "${BASE_DIR}/.env" ]; then
  if [ -f "${BASE_DIR}/env.example" ]; then
    cp "${BASE_DIR}/env.example" "${BASE_DIR}/.env"
    echo "Created ${BASE_DIR}/.env. Fill in API keys, then run this script again."
    exit 1
  fi

  echo "Missing ${BASE_DIR}/.env" >&2
  exit 1
fi

if [ ! -f "${DATA_DIR}/config.json" ]; then
  if [ -f "${BASE_DIR}/config.example.json" ]; then
    cp "${BASE_DIR}/config.example.json" "${DATA_DIR}/config.json"
    echo "Created ${DATA_DIR}/config.json. Review config, then run this script again."
    exit 1
  fi

  echo "Missing ${DATA_DIR}/config.json" >&2
  exit 1
fi

if [ -f "${IMAGE_TAR}" ]; then
  echo "Loading Docker image from ${IMAGE_TAR}..."
  docker load -i "${IMAGE_TAR}"
elif ! docker image inspect "${IMAGE_NAME}" >/dev/null 2>&1; then
  echo "Docker image not found locally and tar file is missing: ${IMAGE_TAR}" >&2
  exit 1
fi

echo "Running Horizon for last ${HOURS} hours..."
docker run --rm \
  --name horizon-once \
  --env-file "${BASE_DIR}/.env" \
  -e TZ="${TZ:-Asia/Shanghai}" \
  -v "${DATA_DIR}:/app/data" \
  "${IMAGE_NAME}" \
  --hours "${HOURS}"

if [ -d "${DATA_DIR}/summaries" ]; then
  find "${DATA_DIR}/summaries" -type f -name "*.md" -exec cp -p {} "${REPORTS_DIR}/" \;
  echo "Markdown summaries copied to ${REPORTS_DIR}"
else
  echo "No summary directory found: ${DATA_DIR}/summaries"
fi
