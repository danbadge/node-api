heroku git:remote -a node-api-$ENVIRONMENT -r $ENVIRONMENT
echo $SNAP_PIPELINE_COUNTER
git push $ENVIRONMENT 0.0.$SNAP_PIPELINE_COUNTER:master
./check.sh