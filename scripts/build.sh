#!/bin/bash
set -e

echo "Building Docker image..."
docker build -t bulls-and-cows:latest . 