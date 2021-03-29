#!/bin/bash -x

# Trigger the deployment
keptn trigger delivery --project=easytravel --service=easytravel-mongodb --image=docker.io/dynatrace/easytravel-mongodb --tag=2.0.0.3273 --labels=creator=cli
sleep 30
# Trigger the deployment
keptn trigger delivery --project=easytravel --service=easytravel-backend --image=docker.io/dynatrace/easytravel-backend --tag=2.0.0.3256 --labels=creator=cli
# Trigger the deployment
keptn trigger delivery --project=easytravel --service=easytravel-frontend --image=docker.io/dynatrace/easytravel-frontend --tag=2.0.0.3256 --labels=creator=cli
# Trigger the deployment
keptn trigger delivery --project=easytravel --service=easytravel-www --image=docker.io/easytravel-nginx:2.0.0.3256 --tag=2.0.0.3256 --labels=creator=cli
