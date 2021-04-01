#!/bin/bash -x

KEPTN_PREP_DIR="overview"
KEPTN_EXAMPLES_DIR="examples"

echo $HOME

#move files for jmeter
cp ${HOME}/${KEPTN_PREP_DIR}/demo_onbording/dev/carts/jmeter/load.jmx ${HOME}/${KEPTN_EXAMPLES_DIR}/onboarding-carts/jmeter/load.jmx
cp ${HOME}/${KEPTN_PREP_DIR}/demo_onbording/dev/carts/jmeter/basiccheck.jmx ${HOME}/${KEPTN_EXAMPLES_DIR}/onboarding-carts/jmeter/basiccheck.jmx
