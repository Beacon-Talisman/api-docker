#!/usr/bin/env bash

. common.sh

docker build \
        --force-rm \
        -t $DOCKER_IMAGE \
        --build-arg ssh_prv_key="$(cat ~/.ssh/id_rsa)" \
        --build-arg ssh_pub_key="$(cat ~/.ssh/id_rsa.pub)" \
        .
