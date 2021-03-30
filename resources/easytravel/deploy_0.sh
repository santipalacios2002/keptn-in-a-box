#!/bin/bash -x

# Trigger the deployment
keptn trigger delivery --project=easytravel --service=easytravel-mongodb --image=docker.io/dynatrace/easytravel-mongodb --tag=latest --labels=creator=cli
sleep 30
# Trigger the deployment
keptn trigger delivery --project=easytravel --service=easytravel-backend --image=docker.io/dynatrace/easytravel-backend --tag=latest --labels=creator=cli
# Trigger the deployment
keptn trigger delivery --project=easytravel --service=easytravel-frontend --image=docker.io/dynatrace/easytravel-frontend --tag=latest --labels=creator=cli
# Trigger the deployment
keptn trigger delivery --project=easytravel --service=easytravel-www --image=docker.io/dynatrace/easytravel-nginx --tag=latest --labels=creator=cli
