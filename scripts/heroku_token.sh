#!/bin/bash
set -e #exit on error
(echo ${HEROKU_USER} && echo ${HEROKU_PWD}) | heroku login > /dev/null 2>&1

heroku auth:token
