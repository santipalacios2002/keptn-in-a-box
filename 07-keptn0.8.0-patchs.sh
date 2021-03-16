#!/bin/bash
# perform steps for keptn 0.8.0
KEPTN_IN_A_BOX_DIR="~/keptn-in-a-box"

cd ~/examples/onboarding-carts
keptn create project sockshop --shipyard=./shipyard.yaml

cd ~/keptn-in-a-box/resources/gitea
./update-git-keptn-post-flight.sh

#cd ~/examples/onboarding-carts
#keptn add-resource --project=sockshop --resource=sli-config-dynatrace.yaml --resourceUri=dynatrace/sli.yaml

cd ~/keptn-in-a-box/resources/demo
./deploy_carts_0.sh

#keptn configure monitoring dynatrace --project=performance
