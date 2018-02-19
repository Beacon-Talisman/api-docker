#!/bin/bash

. common.sh

docker run -d -it \
    --cap-add SYS_ADMIN \
    --restart always \    
    -p 3000:3000 \
    -p 33061:3306 \
    -v "/home/vencuro/tal-api":/tal-api \
    --name $DOCKER_CONTAINER \
    $DOCKER_IMAGE
