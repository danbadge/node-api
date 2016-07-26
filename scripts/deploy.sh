#!/bin/bash
set -x #echo on
set -e #exit on error

app_id=node-api-$ENVIRONMENT
version=0.0.$SNAP_PIPELINE_COUNTER

docker login --email=_ --username=_ --password=$(heroku auth:token) registry.heroku.com
docker tag $REGISTRY/node-api:$version registry.heroku.com/$app_id/web
docker push registry.heroku.com/$app_id/web #this does a deploy too
# can you login to multiple registry?

./scripts/check.sh
