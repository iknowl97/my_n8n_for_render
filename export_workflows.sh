#!/usr/bin/env bash

# Load environment variables from .env file
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

: ${EXPORT_DIR:="n8n-$(date +%Y%m%d)"}
: ${DATA_FOLDER:="/home/node/.n8n"}
: ${EXPORT_ROOT:="./backups"}

# Create backup directory if it doesn't exist
mkdir -p $EXPORT_ROOT

set -euo

docker run \
    -p ${PORT:-5678}:5678 \
    -v $(pwd)/.env:/home/node/.n8n/.env \
    -v ${DATA_FOLDER}/n8n:/home/node/.n8n \
    -e N8N_ENCRYPTION_KEY \
    -e GENERIC_TIMEZONE \
    -e TZ \
    -e DB_TYPE \
    -e DB_POSTGRESDB_DATABASE \
    -e DB_POSTGRESDB_HOST \
    -e DB_POSTGRESDB_PORT \
    -e DB_POSTGRESDB_USER \
    -e DB_POSTGRESDB_SCHEMA \
    -e DB_POSTGRESDB_PASSWORD \
    -v $EXPORT_ROOT:/backup \
    -u node \
    docker.n8n.io/n8nio/n8n:latest \
    n8n export:workflow --backup --output=/backup/$EXPORT_DIR/ \
    --data=/home/node/.n8n

echo "Workflows exported to $EXPORT_ROOT/$EXPORT_DIR/"
