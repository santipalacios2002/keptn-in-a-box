#!/bin/bash -x

waitForAllPods() {
  RETRY=0
  RETRY_MAX=60
  # Get all pods, count and invert the search for not running nor completed. Status is for deleting the last line of the output
  CMD="bashas \"kubectl get pods -n keptnorders-staging -A 2>&1 | grep -c -v -E '(Running|Completed|Terminating|STATUS)'\""
  printInfo "Checking and wait for all pods to run."
  while [[ $RETRY -lt $RETRY_MAX ]]; do
    pods_not_ok=$(eval "$CMD")
    if [[ "$pods_not_ok" == '0' ]]; then
      printInfo "All pods are running."
      break
    fi
    RETRY=$(($RETRY + 1))
    printInfo "Retry: ${RETRY}/${RETRY_MAX} - Wait 10s for $pods_not_ok PoDs to finish or be in state Running ..."
    sleep 10
  done

  if [[ $RETRY == $RETRY_MAX ]]; then
    printError "Pods in namespace ${NAMESPACE} are not running. Exiting installation..."
    bashas "kubectl get pods --field-selector=status.phase!=Running -A"
#    break
    exit 1
  fi
}

printInfo() {
  echo "[Keptn-In-A-Box|INFO] $(timestamp) |>->-> $1 <-<-<|"
}

# Trigger the deployment
keptn trigger delivery --project=keptnorders --service=catalog --image=docker.io/dtdemos/dt-orders-catalog-service --tag=1

# Trigger the deployment
keptn trigger delivery --project=keptnorders --service=customer --image=docker.io/dtdemos/dt-orders-customer-service --tag=1

waitForAllPods
# Trigger the deployment
keptn trigger delivery --project=keptnorders --service=order --image=docker.io/dtdemos/dt-orders-order-service --tag=1

# Trigger the deployment
keptn trigger delivery --project=keptnorders --service=frontend --image=docker.io/dtdemos/dt-orders-frontend --tag=1

