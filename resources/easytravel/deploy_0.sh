#!/bin/bash -x

# Trigger the deployment
keptn trigger delivery --project=easytravel --service=easytravel-mongodb --image=docker.io/dynatrace/easytravel-mongodb --tag=2.0.0.3156 --sequence=delivery-direct --labels=creator=cli
sleep 30
# Trigger the deployment
keptn trigger delivery --project=easytravel --service=easytravel-backend --image=docker.io/dynatrace/easytravel-backend --tag=2.0.0.3256 --labels=creator=cli
# Trigger the deployment
keptn trigger delivery --project=easytravel --service=easytravel-frontend --image=docker.io/dynatrace/dynatrace/easytravel-loadgen --tag=latest --labels=creator=cli
