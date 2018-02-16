#!/bin/bash

. common.sh

docker run -d -it \
    --restart always \
    -p 3000:3000 \
    -p 3306:3306 \
    --name $DOCKER_CONTAINER \
    $DOCKER_IMAGE
