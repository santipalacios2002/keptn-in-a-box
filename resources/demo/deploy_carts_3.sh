#!/bin/bash -x

keptn trigger delivery --project=sockshop --service=carts --image=docker.io/keptnexamples/carts --tag=0.11.3 --labels=creator=cli,build=03

