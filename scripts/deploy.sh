#!/bin/bash
set -x #echo on
set -e #exit on error

heroku git:remote -a node-api-$ENVIRONMENT -r $ENVIRONMENT
echo $SNAP_PIPELINE_COUNTER
git push -f $ENVIRONMENT 0.0.$SNAP_PIPELINE_COUNTER:master
./check.sh