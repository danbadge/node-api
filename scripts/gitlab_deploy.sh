#!/bin/bash
set -x #echo on
set -e #exit on error

docker login $CI_REGISTRY

heroku_app_name=node-api-$ENVIRONMENT

full_image_name=$CI_REGISTRY/danbadge/node-api:1.$CI_PIPELINE_ID.0

# login heroku registry
docker login --email=_ --username=_ --password=$(heroku auth:token) registry.heroku.com

docker pull $full_image_name
{
  docker tag $full_image_name registry.heroku.com/$heroku_app_name/web
} || {
  # Ubuntu - needs forcing if we're rolling back and tag exists
  docker tag -f $full_image_name registry.heroku.com/$heroku_app_name/web
}

# on push to heroku registry it deploys app
docker push registry.heroku.com/$app_id/web

./scripts/check.sh
