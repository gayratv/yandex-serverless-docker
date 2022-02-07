#!/bin/sh
export $(grep -v '^#' main.env | xargs -d '\n')
echo "CONTAINER_REGISTRY : $CONTAINER_REGISTRY"
echo "REPOSITORY_NAME : $REPOSITORY_NAME"

rep_name_full="$CONTAINER_REGISTRY/$REPOSITORY_NAME"
echo "rep_name_full $rep_name_full"

docker build -t ${rep_name_full}:0.0.1 .
docker push ${rep_name_full}:0.0.1
