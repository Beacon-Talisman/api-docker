#!/bin/bash

DOCKER_CONTAINER=vencuro_api
DOCKER_IMAGE=local/$DOCKER_CONTAINER:1.1

# this is for localhost
# docker run -d -it  --cap-add SYS_ADMIN --restart always -p 3000:3000 -p 3306:3306 -v "c:/Users/marius/Projects/Talisman/vencuro_dev":/tal-api --name $DOCKER_CONTAINER  $DOCKER_IMAGE
docker run -d -it  --cap-add SYS_ADMIN --restart always -p 3000:3000 -p 3306:3306 --name $DOCKER_CONTAINER  $DOCKER_IMAGE

# this is for roweb dev server
docker run -d -it --cap-add SYS_ADMIN --expose 80  -v /sys/fs/cgroup:/sys/fs/cgroup:ro  --tmpfs /run  --tmpfs /run/lock --net nginx-proxy --restart always -p 33061:3306 -e VIRTUAL_HOST=vencuro-api.dock.roweb.ro -v "/home/vencuro/tal-api":/tal-api  --name $DOCKER_CONTAINER $DOCKER_IMAGE
