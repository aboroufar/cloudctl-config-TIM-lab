#!/bin/bash

#METAL3_DIR="/root/kube-cluster/metal3-dev-env"
METAL3_DIR="$(dirname "$(readlink -f "${0}")")/../.."

export ACTION="provision_worker"

"${METAL3_DIR}"/scripts/run.sh
