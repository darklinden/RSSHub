#!/usr/local/env bash

IMAGE_NAME=rsshub-local
IMAGE_TAG=$(git rev-parse --short HEAD)

# Build the Docker image if it does not exist
if [[ "$(docker images -q $IMAGE_NAME:$IMAGE_TAG 2>/dev/null)" == "" ]]; then
    docker build -t $IMAGE_NAME:$IMAGE_TAG .
fi

# start the Docker container
docker run -it --rm -p 1200:1200 $IMAGE_NAME:$IMAGE_TAG
