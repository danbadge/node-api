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

docker tag $REGISTRY/node-api:$version registry.heroku.com/$app_id/web
docker push registry.heroku.com/$app_id/web #this does a deploy too

./scripts/check.sh
