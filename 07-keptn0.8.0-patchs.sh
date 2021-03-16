#!/bin/bash
# perform steps for keptn 0.8.0
KEPTN_IN_A_BOX_DIR="~/keptn-in-a-box"


cd $KEPTN_IN_A_BOX_DIR/resources/gitea/
./update-git-keptn-post-flight.sh


#keptn configure monitoring dynatrace --project=performance
