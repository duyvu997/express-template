#!/bin/bash

read -e -p "Do you want start with image name: " -i "eplocal" IMAGE_NAME
export FULL_IMAGE_NAME="${IMAGE_NAME}:latest"
export CONTAINER_NAME="express-template"

if [[ "$(docker image inspect "${FULL_IMAGE_NAME}" > /dev/null 2>&1)" == "" ]]
then
    export CONTAINER_ID=$(docker ps -a -q --filter ancestor="${FULL_IMAGE_NAME}")
    docker rm -f ${CONTAINER_ID}
    docker rmi ${FULL_IMAGE_NAME}
fi

docker build --tag ${IMAGE_NAME} .

docker run -id -p 3000:3000 --name ${CONTAINER_NAME} ${IMAGE_NAME}
