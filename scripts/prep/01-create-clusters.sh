#!/usr/bin/env bash

. ../magic.sh

load_config

ACCOUNT_NAME="bush"
SSH_KEY_NAME="tmc-key-pair"
REGION="us-east-2"
GROUP="bush"

tmc cluster create --account-name ${ACCOUNT_NAME} --ssh-key-name ${SSH_KEY_NAME} --region ${REGION} --worker-node-count 3 --instance-type m5.xlarge --group ${GROUP} --name ${CICD_CLUSTER}
tmc cluster create --account-name ${ACCOUNT_NAME} --ssh-key-name ${SSH_KEY_NAME} --region ${REGION} --worker-node-count 3 --instance-type m5.xlarge --group ${GROUP} --name ${ALPHA_CLUSTER}
tmc cluster create --account-name ${ACCOUNT_NAME} --ssh-key-name ${SSH_KEY_NAME} --region ${REGION} --worker-node-count 2 --instance-type m5.xlarge --group ${GROUP} --name ${BRAVO_CLUSTER}
