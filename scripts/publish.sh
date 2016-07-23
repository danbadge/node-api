#!/bin/bash
set -x #echo on
set -e #exit on error

version=0.0.$SNAP_PIPELINE_COUNTER

sudo docker build -t $REGISTRY/node-api:$version .

sudo docker stop node-api-test
sudo docker rm node-api-test
sudo docker run -d -p 80:3000 --name node-api-test $REGISTRY/node-api:$version

login_command=`aws ecr get-login`
eval $login_command

if [[ `aws ecr describe-repositories | grep "node-api"` ]]; then
  echo "ECR repository already exists - no need to create!"
else
	aws ecr create-repository --repository-name node-api
fi

sudo docker push $REGISTRY/node-api:$version