#!/usr/bin/env bash

. magic.sh

load_config

echo '----------------------------------------------'
echo '     Configuring Credentials in Alpha cluster'
echo '----------------------------------------------'

echo ''
echo 'Continue to switch to the Alpha Cluster...'
pe "kubectx ${ALPHA_CLUSTER}"

echo ''
cat kubernetes/cicd/argocd/rabbit-secret.template.yml | sed "s/RABBITMQ_PASSWORD/$ALPHA_RABBITMQ_PASSWORD/" | kubectl create -n ${ALPHA_NAMESPACE} -f -

cat kubernetes/cicd/argocd/wavefront-token.template.yml | sed "s/WAVEFRONT_TOKEN/$ALPHA_WAVEFRONT_TOKEN/" | kubectl create -n ${ALPHA_NAMESPACE} -f -

echo '----------------------------------------------'
echo '     Configuring Credentials in Bravo cluster'
echo '----------------------------------------------'

echo ''
echo 'Continue to switch to the Bravo Cluster...'
pe "kubectx ${BRAVO_CLUSTER}"

echo ''
cat kubernetes/cicd/argocd/wavefront-token.template.yml | sed "s/WAVEFRONT_TOKEN/$BRAVO_WAVEFRONT_TOKEN/" | kubectl create -n ${BRAVO_NAMESPACE} -f -
