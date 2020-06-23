#!/usr/bin/env bash

. magic.sh

load_config

echo '----------------------------------------------'
echo '         Configuring Service Mesh'
echo '----------------------------------------------'

echo ''
echo 'Continue to switch to Alpha Cluster...'

pe "kubectx ${ALPHA_CLUSTER}"
kubectl create -f kubernetes/istio/ingressgateway.yaml
kubectl create -f kubernetes/istio/virtualservice-alpha.yaml

echo ''
echo 'Continue to switch to Bravo Cluster...'

pe "kubectx ${BRAVO_CLUSTER}"
kubectl create -f kubernetes/istio/ingressgateway.yaml
kubectl create -f kubernetes/istio/virtualservice-bravo.yaml
