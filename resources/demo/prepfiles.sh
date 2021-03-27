#!/bin/bash -x

KEPTN_PREP_DIR="overview"
KEPTN_EXAMPLES_DIR="examples"

cd ~

#move files for jmeter
cp /home/dynatrace/$KEPTN_PREP_DIR/demo_onbording/dev/carts/jmeter/load.jmx /home/dynatrace/$KEPTN_EXAMPLES_DIR/onboarding-carts/jmeter/load.jmx
cp /home/dynatrace/$KEPTN_PREP_DIR/demo_onbording/dev/carts/jmeter/basiccheck.jmx /home/dynatrace/$KEPTN_EXAMPLES_DIR/onboarding-carts/jmeter/basiccheck.jmx
