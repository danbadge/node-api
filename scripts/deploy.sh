#!/bin/bash
set -x #echo on
set -e #exit on error

app_id=node-api-$ENVIRONMENT
version=0.0.$SNAP_PIPELINE_COUNTER

# login heroku registry
docker login --email=_ --username=_ --password=$(heroku auth:token) registry.heroku.com

# login aws registry
login_command=`aws ecr get-login`
eval $login_command

# pull image incase we don't have it
docker pull $REGISTRY/node-api:$version
{
  # MAC OSX
  docker tag $REGISTRY/node-api:$version registry.heroku.com/$app_id/web 
} || {
  # Ubuntu
  docker tag -f $REGISTRY/node-api:$version registry.heroku.com/$app_id/web 
}

# on push to heroku registry it deploys app
docker push registry.heroku.com/$app_id/web

./scripts/check.sh
