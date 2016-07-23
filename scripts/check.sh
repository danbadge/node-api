#!/bin/bash
set -x #echo on
set -e #exit on error

curl -v http://node-api-$ENVIRONMENT.herokuapp.com