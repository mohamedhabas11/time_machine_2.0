#!/bin/bash

PLATFORM_VERSION=1
UPDATE_VERSION="v0.00.1"
APP_VERSION="v1.00.0"

cd "$(dirname $0)"

RELEASE=${APP_VERSION}-${UPDATE_VERSION}-${PLATFORM_VERSION}

echo ${RELEASE}

DOCKER_REPO=boxy14
IMAGE_NAME=dockerized_app

# Build image
docker build -t ${IMAGE_NAME}:${RELEASE} \
    --build-arg APP_VERSION=${APP_VERSION} .

docker tag ${IMAGE_NAME}:${RELEASE} ${DOCKER_REPO}/${IMAGE_NAME}:${RELEASE}

# Push image
docker push ${DOCKER_REPO}/${IMAGE_NAME}:${RELEASE}
