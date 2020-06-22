#!/usr/bin/env bash

. magic.sh

load_config

tmc cluster delete ${CICD_CLUSTER}
tmc cluster delete ${ALPHA_CLUSTER}
tmc cluster delete ${BRAVO_CLUSTER}
