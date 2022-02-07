#!/bin/sh
export $(grep -v '^#' main.env | xargs -d '\n')


echo "yc serverless container delete ${CONTAINER_NAME}"
rm contid.env
yc serverless container delete ${CONTAINER_NAME}
echo "Deploy container"
export CONTAINER_ID=`yc sls container create --name ${CONTAINER_NAME} --folder-id ${FOLDER_ID} | grep  -E "^id: (.*)$" | sed 's/id: //g'`
echo "CONTAINER_ID=$CONTAINER_ID" >contid.env
