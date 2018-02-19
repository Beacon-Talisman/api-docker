#!/bin/bash

DOCKER_CONTAINER=talisman_api
DOCKER_IMAGE=local/$DOCKER_CONTAINER:1.1


#. common.sh

docker run -d -it --cap-add SYS_ADMIN --expose 80  -v /sys/fs/cgroup:/sys/fs/cgroup:ro  --tmpfs /run  --tmpfs /run/lock --net nginx-proxy --restart always -p 33061:3306 -e VIRTUAL_HOST=vencuro-api.dock.roweb.ro -v "/home/vencuro/tal-api":/tal-api  --name $DOCKER_CONTAINER $DOCKER_IMAGE
