#!/usr/bin/env bash

. ../magic.sh

load_config

set -e

echo "Retrieving token ..."
TOKEN=$(curl -s -H "Content-Type: application/json" -X POST -d '{"username": "'${DOCKERHUB_USERNAME}'", "password": "'${DOCKERHUB_PASSWORD}'"}' https://hub.docker.com/v2/users/login/ | jq -r .token)

echo ""
REPOSITORY_NAME="account-service"
echo "Deleting: ${DOCKERHUB_USERNAME}/${REPOSITORY_NAME}"
curl -X DELETE -s -H "Authorization: JWT ${TOKEN}" https://hub.docker.com/v2/repositories/${DOCKERHUB_USERNAME}/${REPOSITORY_NAME}/

echo ""
REPOSITORY_NAME="confirmation-service"
echo "Deleting: ${DOCKERHUB_USERNAME}/${REPOSITORY_NAME}"
curl -X DELETE -s -H "Authorization: JWT ${TOKEN}" https://hub.docker.com/v2/repositories/${DOCKERHUB_USERNAME}/${REPOSITORY_NAME}/

echo ""
REPOSITORY_NAME="payment-service"
echo "Deleting: ${DOCKERHUB_USERNAME}/${REPOSITORY_NAME}"
curl -X DELETE -s -H "Authorization: JWT ${TOKEN}" https://hub.docker.com/v2/repositories/${DOCKERHUB_USERNAME}/${REPOSITORY_NAME}/

echo ""
REPOSITORY_NAME="dotnet-core-react-example"
echo "Deleting: ${DOCKERHUB_USERNAME}/${REPOSITORY_NAME}"
curl -X DELETE -s -H "Authorization: JWT ${TOKEN}" https://hub.docker.com/v2/repositories/${DOCKERHUB_USERNAME}/${REPOSITORY_NAME}/

echo ""
echo "Done!"
