#!/bin/bash

. common.sh

docker run -d -it \
    --restart always \    
    -p 3000:3000 \
    -p 3306:3306 \
    -v "/Projects/Vencuro/tal-api":/tal-api
    --name $DOCKER_CONTAINER \
    $DOCKER_IMAGE
