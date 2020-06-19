#!/usr/bin/env bash

. magic.sh

load_config

kubectx ${CICD_CLUSTER}
kubectl create clusterrolebinding privileged-role-binding --clusterrole=vmware-system-tmc-psp-privileged --group=system:authenticated

kubectx ${DEV_CLUSTER}
kubectl create clusterrolebinding privileged-role-binding --clusterrole=vmware-system-tmc-psp-privileged --group=system:authenticated
kubectl label namespace default istio-injection=enabled

kubectx ${PROD_CLUSTER}
kubectl create clusterrolebinding privileged-role-binding --clusterrole=vmware-system-tmc-psp-privileged --group=system:authenticated
kubectl label namespace default istio-injection=enabled
