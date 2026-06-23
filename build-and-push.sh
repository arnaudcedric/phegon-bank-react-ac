#!/bin/bash

set -e

VERSION=v1

echo "Building and pushing React frontend image $VERSION..."

docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t ghcr.io/arnaudcedric/phegonbank-react:$VERSION \
  -t ghcr.io/arnaudcedric/phegonbank-react:latest \
  --push .

echo "Frontend image pushed successfully!"