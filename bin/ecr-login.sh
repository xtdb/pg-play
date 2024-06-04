#!/usr/bin/env sh

aws ecr get-login-password --region eu-west-1 \
    | docker login --username AWS --password-stdin 204979695204.dkr.ecr.eu-west-1.amazonaws.com
