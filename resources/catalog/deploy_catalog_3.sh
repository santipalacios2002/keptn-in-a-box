#!/bin/bash -x

# Trigger the deployment
keptn trigger delivery --project=keptnorders --service=catalog --image=docker.io/dtdemos/dt-orders-catalog-service --tag=1

# Trigger the deployment
keptn trigger delivery --project=keptnorders --service=order --image=docker.io/dtdemos/dt-orders-order-service --tag=3

# Trigger the deployment
keptn trigger delivery --project=keptnorders --service=frontend --image=docker.io/dtdemos/dt-orders-frontend --tag=1

# Trigger the deployment
keptn trigger delivery --project=keptnorders --service=customer --image=docker.io/dtdemos/dt-orders-customer-service --tag=3
