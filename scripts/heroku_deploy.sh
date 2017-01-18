#!/bin/bash
set -e #exit on error
set -x #echo on

ls -la

COMMIT_SHA=${CI_BUILD_REF:-${BUILDKITE_COMMIT}}

(echo ${HEROKU_USER} && echo ${HEROKU_PASSWORD}) | heroku login

heroku git:remote -a $HEROKU_APP_NAME -r $CI_ENVIRONMENT_NAME
git push -f $CI_ENVIRONMENT_NAME $COMMIT_SHA:master
