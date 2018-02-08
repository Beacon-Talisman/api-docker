#!/bin/bash

. common.sh

docker rm $DOCKER_CONTAINER 
docker rmi $DOCKER_IMAGE 
