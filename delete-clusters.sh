#!/usr/bin/env bash

. magic.sh

load_config

tmc cluster delete ${CICD_CLUSTER}
tmc cluster delete ${DEV_CLUSTER}
tmc cluster delete ${PROD_CLUSTER}
