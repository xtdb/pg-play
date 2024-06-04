#!/usr/bin/env bash

set -e
(
    cd $(dirname $0)

    if [ "$1" == "--clean" ] || ! [ -e build/libs/xtdb-standalone.jar ]; then
        ./gradlew shadowJar
    fi

    echo Building Docker image ...
    docker build -t 204979695204.dkr.ecr.eu-west-1.amazonaws.com/pg-play:latest --output type=docker .
    echo Done
)
