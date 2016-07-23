#!/bin/bash
set -x #echo on
set -e #exit on error

curl -v --fail http://node-api-$ENVIRONMENT.herokuapp.com