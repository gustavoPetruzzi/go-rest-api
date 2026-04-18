#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <service-name>"
    exit 1
fi

SERVICE="$1"
SERVICE_DEV="${SERVICE}-dev"

sed -i "s/^  golang:/  ${SERVICE}:/" docker-compose.yml
sed -i "s/container_name: golang-dev/container_name: ${SERVICE_DEV}/" docker-compose.yml

sed -i "s/\"service\": \"golang\"/\"service\": \"${SERVICE}\"/" .devcontainer/devcontainer.json

sed -i "s/first-app/${SERVICE}/" go.mod

echo "Updated go.mod module to: ${SERVICE}"
echo "Updated devcontainer service to: ${SERVICE}"
