#!/usr/bin/env sh

aws cloudformation update-stack \
    --capabilities CAPABILITY_IAM \
    --stack-name pg-play--service \
    --template-body "file://$(pwd)/cloudformation/service.yml" \
    --parameters ParameterKey=DockerTag,UsePreviousValue=true
