#!/bin/bash -x

# Trigger the deployment
keptn trigger delivery --project=easytravel --service=easytravel-mongodb --image=docker.io/dynatrace/easytravel-mongodb --sequence=delivery-direct --tag=latest --labels=creator=cli
sleep 45
# Trigger the deployment
keptn trigger delivery --project=easytravel --service=easytravel-backend --image=docker.io/dynatrace/easytravel-backend --tag=latest --labels=creator=cli
sleep 180
# Trigger the deployment
keptn trigger delivery --project=easytravel --service=easytravel-frontend --image=docker.io/dynatrace/easytravel-frontend --tag=latest --labels=creator=cli
sleep 180
# Trigger the deployment
keptn trigger delivery --project=easytravel --service=easytravel-www --image=docker.io/dynatrace/easytravel-nginx --tag=latest --labels=creator=cli
#sleep 180
#keptn trigger delivery --project=easytravel --service=loadgenerator --image=docker.io/dynatrace/easytravel-loadgen --sequence=delivery-direct --tag=latest --labels=creator=cli
