#!/bin/bash

DOCKER_CONTAINER=vencuro_api
DOCKER_IMAGE=local/$DOCKER_CONTAINER:1.1

echo docker exec -it $DOCKER_CONTAINER bash
docker exec -it $DOCKER_CONTAINER bash
