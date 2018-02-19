#!/usr/bin/env bash

DOCKER_CONTAINER=vencuro_api
DOCKER_IMAGE=local/$DOCKER_CONTAINER:1.1
USERNAME=[put_your_github_username_here]
PASSWORD=[put_your_github_password_here]

docker build --force-rm -t $DOCKER_IMAGE --build-arg ssh_prv_key="$USERNAME" --build-arg ssh_pub_key="$PASSWORD" .