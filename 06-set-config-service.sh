#!/bin/bash
# use to change the jmeter service.

ALT_JMETER_SERVICE_BRANCH="release-0.8.0-alpha"

# use for host aliases
sudo kubectl apply -f https://raw.githubusercontent.com/dthotday-performance/keptn/${ALT_JMETER_SERVICE_BRANCH}/configuration-service/deploy/service.yaml -n keptn --record

# use for host aliases
#sudo kubectl apply -f https://raw.githubusercontent.com/dthotday-performance/keptn/${ALT_JMETER_SERVICE_BRANCH}/jmeter-service/deploy/service.yaml -n keptn --record
# original to KIAB
# sudo kubectl apply -f https://raw.githubusercontent.com/dthotday-performance/keptn/feature/2552/jmeterextensionskeptn072/jmeter-service/deploy/service.yaml -n keptn --record

# use for host aliases
#sudo kubectl apply -f https://raw.githubusercontent.com/dthotday-performance/keptn/${ALT_JMETER_SERVICE_BRANCH}/bridge/deploy/bridge.yaml -n keptn --record

sleep 10

sudo kubectl get pods --all-namespaces | grep configuration-service
sudo kubectl get pods --all-namespaces | grep jmeter-service
sudo kubectl get pods --all-namespaces | grep bridge
