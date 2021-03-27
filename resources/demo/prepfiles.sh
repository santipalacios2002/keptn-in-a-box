#!/bin/bash -x

KEPTN_PREP_DIR="~/overview"
KEPTN_EXAMPLES_DIR="~/examples"

cd ~

#move files for jmeter
cp $KEPTN_PREP_DIR/demo_onbording/dev/carts/jmeter/load.jmx $KEPTN_EXAMPLES_DIR/onboarding-carts/jmeter/load.jmx
cp $KEPTN_PREP_DIR/demo_onbording/dev/carts/jmeter/basiccheck.jmx $KEPTN_EXAMPLES_DIR/onboarding-carts/jmeter/basiccheck.jmx
