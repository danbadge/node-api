docker run \
-e HEROKU_USER \
-e HEROKU_PASSWORD \
-e BUILDKITE_COMMIT \
-e HEROKU_APP_NAME \
-e CI_ENVIRONMENT_NAME \
-v $(pwd):/usr/src \
--workdir /usr/src \
driftrock/heroku-cli:shell ./scripts/heroku_deploy.sh
