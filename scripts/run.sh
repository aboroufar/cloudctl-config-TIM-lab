#!/bin/bash

set -xe

METAL3_DIR="/root/kube-cluster/metal3-dev-env"

ACTION="${ACTION:-""}"

# shellcheck disable=SC1090
# shellcheck disable=SC1091
source "${METAL3_DIR}/lib/logging.sh"
# shellcheck disable=SC1090
# shellcheck disable=SC1091
source "${METAL3_DIR}/lib/common.sh"
# shellcheck disable=SC1090
# shellcheck disable=SC1091
source "${METAL3_DIR}/lib/releases.sh"
# shellcheck disable=SC1090
# shellcheck disable=SC1091
source "${METAL3_DIR}/lib/network.sh"
# shellcheck disable=SC1090
# shellcheck disable=SC1091
source "${METAL3_DIR}/lib/images.sh"
# shellcheck disable=SC1090
# shellcheck disable=SC1091
#source "${METAL3_DIR}/lib/ironic_tls_setup.sh"
# shellcheck disable=SC1090
# shellcheck disable=SC1091
#source "${METAL3_DIR}/lib/ironic_basic_auth.sh"

# Disable SSH strong authentication
export ANSIBLE_HOST_KEY_CHECKING=False
echo "${METAL3_DIR}/vm-setup/v1aX_integration_test.yml"
ANSIBLE_FORCE_COLOR=true ansible-playbook \
   -e "metal3_dir=$METAL3_DIR" \
   -e "v1aX_integration_test_action=${ACTION}" \
   -i "${METAL3_DIR}/vm-setup/inventory.ini" \
   -b -vvv "${METAL3_DIR}/vm-setup/v1aX_integration_test.yml"
