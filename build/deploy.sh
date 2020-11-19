#!/bin/bash

rc='' # remote command
rc='echo one $ANIMAL' # remote command
rc="echo two $ANIMAL" # remote command
# get login token OR
rc+='aws ecr get-login-password --region eu-central-1 | '
# get login to docker registry AND
rc+='docker login --username AWS --password-stdin $AWS_ECR_ACCOUNT_URL && '
# stop and remove docker image, don't check for success, could be the first time
rc+='docker stop $AWS_ECR_REPO; docker rm $AWS_ECR_REPO; '
# pull updated image AND
rc+='docker pull $AWS_ECR_ACCOUNT_URL/$AWS_ECR_REPO && '
# run image with project name, exposing port, passing env variable
rc+='docker run --name=$AWS_ECR_REPO --env ANIMAL=$ANIMAL --restart=always --detach -p 3000:3000 $AWS_ECR_ACCOUNT_URL/$AWS_ECR_REPO:latest'

ssh -o StrictHostKeyChecking=no \
-o SendEnv="ANIMAL" \
-o SendEnv="AWS_ECR_ACCOUNT_URL" \
-o SendEnv="AWS_ECR_REPO" \
-o SendEnv="AWS_ACCESS_KEY_ID" \
-o SendEnv="AWS_SECRET_ACCESS_KEY" \
root@$DEPLOY_HOST "$rc"
