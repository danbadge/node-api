#!/bin/bash
set -e #exit on error
set -x #echo on

ls -la

(echo ${HEROKU_USER} && echo ${HEROKU_PWD}) | heroku login

heroku git:remote -a $HEROKU_APP_NAME -r $CI_ENVIRONMENT_NAME
git push -f $CI_ENVIRONMENT_NAME $CI_BUILD_REF
