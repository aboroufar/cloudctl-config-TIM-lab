M3PATH := "$(dirname "$(readlink -f "${0}")")../../../"
export NUM_OF_MASTER_REPLICAS := 3
export NUM_OF_WORKER_REPLICAS := 1

all: provision pivoting repivoting deprovision

provision:
	./../feature_test_provisioning.sh

pivoting:
	./pivot.sh

repivoting:
	./repivot.sh

deprovision:
	./../feature_test_deprovisioning.sh

upgrading:
	./upgrade.sh
