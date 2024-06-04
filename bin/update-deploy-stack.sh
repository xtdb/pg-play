#!/usr/bin/env sh

aws cloudformation update-stack \
    --capabilities CAPABILITY_IAM \
    --stack-name pg-play--deploy \
    --template-body "file://$(pwd)/cloudformation/deploy.yml" \
    --parameters ParameterKey=HostedZoneId,UsePreviousValue=true ParameterKey=HostedZoneName,UsePreviousValue=true
