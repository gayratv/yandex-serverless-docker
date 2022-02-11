#!/bin/sh
export $(grep -v '^#' main.env | xargs -d '\n')
export $(grep -v '^#' contid.env | xargs -d '\n')

echo 'yc sls container revisions deploy '
yc sls container revisions deploy \
	--folder-id ${FOLDER_ID} \
	--container-id ${CONTAINER_ID} \
	--memory 512M \
	--cores 1 \
	--execution-timeout 5s \
	--concurrency 4 \
	--environment AWS_ACCESS_KEY_ID=FAKE_AWS_ACCESS_KEY_ID,AWS_SECRET_ACCESS_KEY=FAKE_AWS_SECRET_ACCESS_KEY \
	--service-account-id ${SA_ID} \
	--image ${CONTAINER_REGISTRY}/${REPOSITORY_NAME}:${VERSION}
