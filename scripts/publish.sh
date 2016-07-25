#!/bin/bash
set -x #echo on
set -e #exit on error

version=0.0.$SNAP_PIPELINE_COUNTER

git tag $version
git push origin --tag

docker build -t $REGISTRY/node-api:$version .

docker stop node-api-test
docker rm node-api-test
docker run -d -p 80:3000 --name node-api-test $REGISTRY/node-api:$version
sleep 10
curl -v --fail http://localhost

login_command=`aws ecr get-login`
eval $login_command

if [[ `aws ecr describe-repositories | grep "node-api"` ]]; then
  echo "ECR repository already exists - no need to create!"
else
  aws ecr create-repository --repository-name node-api
fi

docker push $REGISTRY/node-api:$version