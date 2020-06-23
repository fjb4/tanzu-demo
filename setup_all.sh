#!/usr/bin/env bash

. magic.sh

clear

echo '--------------------------------'
echo 'Welcome to the Tanzu Demo setup!'
echo '--------------------------------'

echo '----------------------------------------------------------------------------------'
echo 'Make sure you have kubectl, kubectx and kubens, jq and yq installed in your shell!'
echo '----------------------------------------------------------------------------------'

echo ''
kubectx
echo ''

load_config

echo ''
echo 'Setting up Tanzu Demo with CICD_CLUSTER ['${CICD_CLUSTER}'], ALPHA_CLUSTER ['${ALPHA_CLUSTER}'], and BRAVO_CLUSTER ['${BRAVO_CLUSTER}']'
echo ''

./01-install-kpack.sh

echo ''
echo 'Continue?'
echo ''
read

./02-install-argocd.sh

echo 'Continue?'
echo ''
read

./03-configure-credentials.sh

echo 'Continue?'
echo ''
read

./04-configure-gitops.sh

echo 'Continue?'
echo ''
read

./05-configure-mesh.sh