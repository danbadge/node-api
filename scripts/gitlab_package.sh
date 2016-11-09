#!/bin/bash
set -x #echo on
set -e #exit on error

docker login $CI_REGISTRY

full_image_name=$CI_REGISTRY/danbadge/node-api:1.$CI_PIPELINE_ID.0

docker build -t $full_image_name
docker push $full_image_name
