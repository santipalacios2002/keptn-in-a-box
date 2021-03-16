#!/bin/bash -x

# Trigger the deployment
keptn trigger delivery --project=sockshop --service=carts-db --image=docker.io/mongo --tag=4.2.2 --labels=creator=cli

# Trigger the deployment
keptn trigger delivery --project=sockshop --service=carts --image=docker.io/keptnexamples/carts --tag=0.11.1 --labels=creator=cli

