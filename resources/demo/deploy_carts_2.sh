#!/bin/bash -x

keptn trigger delivery --project=sockshop --service=carts --image=docker.io/keptnexamples/carts --tag=0.11.2 --labels=creator=cli,build=02

