#!/usr/bin/env bash

DOCKER_CONTAINER=vencuro_api
DOCKER_IMAGE=local/$DOCKER_CONTAINER:1.1

docker build --force-rm -t $DOCKER_IMAGE .