#!/usr/bin/env bash

. magic.sh

load_config

KUBECONFIG_CICD=`mktemp`
tmc cluster provisionedcluster kubeconfig get ${CICD_CLUSTER} >> ${KUBECONFIG_CICD}

KUBECONFIG_ALPHA=`mktemp`
tmc cluster provisionedcluster kubeconfig get ${ALPHA_CLUSTER} >> ${KUBECONFIG_ALPHA}

KUBECONFIG_BRAVO=`mktemp`
tmc cluster provisionedcluster kubeconfig get ${BRAVO_CLUSTER} >> ${KUBECONFIG_BRAVO}

KUBECONFIG=${KUBECONFIG_CICD}:${KUBECONFIG_ALPHA}:${KUBECONFIG_BRAVO} kubectl config view --merge --flatten

rm ${KUBECONFIG_CICD}
rm ${KUBECONFIG_ALPHA}
rm ${KUBECONFIG_BRAVO}
