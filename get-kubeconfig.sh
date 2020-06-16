#!/usr/bin/env bash

. magic.sh

load_config

KUBECONFIG_CICD=`mktemp`
tmc cluster provisionedcluster kubeconfig get ${CICD_CLUSTER} >> ${KUBECONFIG_CICD}

KUBECONFIG_DEV=`mktemp`
tmc cluster provisionedcluster kubeconfig get ${DEV_CLUSTER} >> ${KUBECONFIG_DEV}

KUBECONFIG_PROD=`mktemp`
tmc cluster provisionedcluster kubeconfig get ${PROD_CLUSTER} >> ${KUBECONFIG_PROD}

KUBECONFIG=${KUBECONFIG_CICD}:${KUBECONFIG_DEV}:${KUBECONFIG_PROD} kubectl config view --merge --flatten

rm ${KUBECONFIG_CICD}
rm ${KUBECONFIG_DEV}
rm ${KUBECONFIG_PROD}
