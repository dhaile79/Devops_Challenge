#!/bin/bash

set -ex

#PARENT_DIR=$(basename "${PWD%/*}")
#CURRENT_DIR="${PWD##*/}"
IMAGE_NAME=$(docker images --format "{{.Repository}}")
read -p "enter tag for image: " tag_var
TAG=$tag_var

REGISTRY="localhost:5000"

#docker images --format "{{.Repository}}:{{.Tag}}"

docker build -t ${REGISTRY}/${IMAGE_NAME}:${TAG} -t ${REGISTRY}/${IMAGE_NAME}:latest .
docker push ${REGISTRY}/${IMAGE_NAME}