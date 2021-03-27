#!/bin/bash -x

KEPTN_PREP_DIR="~/overview"
KEPTN_EXAMPLES_DIR="~/examples"

#move files for jmeter
sudo cp $KEPTN_PREP_DIR/demo_onbording/dev/carts/jmeter/load.jmx $KEPTN_EXAMPLES_DIR/onboarding-carts/jmeter/load.jmx
sudo cp $KEPTN_PREP_DIR/demo_onbording/dev/carts/jmeter/basiccheck.jmx $KEPTN_EXAMPLES_DIR/onboarding-carts/jmeter/basiccheck.jmx
