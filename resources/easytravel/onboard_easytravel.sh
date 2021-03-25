#!/bin/bash -x

#If directory exists continue, otherwise exit
if [[ -d "easytravel-frontend" ]]; then
    
    # The context for this script needs to be in examples/onboarding-carts
    echo "load shipyard.yaml"
    keptn create project easytravel --shipyard=./shipyard.yaml
    keptn add-resource --project=easytravel --resource=./shipyard.yaml --resourceUri=shipyard.yaml
    # Onboarding - prepare  Keptn
    echo "onboard services"
    keptn onboard service easytravel-mongodb --project=easytravel --chart=./easytravel-mongodb
    keptn onboard service easytravel-backend --project=easytravel --chart=./easytravel-backend
    keptn onboard service easytravel-frontend --project=easytravel --chart=./easytravel-frontend
    
    # add jmeter resources for staging
    echo "load for project"
    keptn add-resource --project=keptnorders --resource=jmeter/frontend/basiccheck.jmx --resourceUri=jmeter/basiccheck.jmx
    #keptn add-resource --project=keptnorders --resource=jmeter/jmeter.conf.yaml --resourceUri=jmeter/jmeter.conf.yaml
    echo "load service level jmeter scripts-staging"
    #keptn add-resource --project=easytravel --service=easytravel-frontend --stage=staging --resource=jmeter/frontend/basiccheck.jmx --resourceUri=jmeter/basiccheck.jmx
    #keptn add-resource --project=easytravel --service=easytravel-frontend --stage=staging --resource=jmeter/frontend/load.jmx --resourceUri=jmeter/load.jmx
    
    #keptn add-resource --project=easytravel --service=easytravel-backend --stage=staging --resource=jmeter/backend/basiccheck.jmx --resourceUri=jmeter/basiccheck.jmx
    #keptn add-resource --project=easytravel --service=easytravel-backend --stage=staging --resource=jmeter/backend/load.jmx --resourceUri=jmeter/load.jmx
    
     
    # add jmeter resources for production
    echo "load service level jmeter scripts-production"
    #keptn add-resource --project=easytravel --service=easytravel-frontend --stage=production --resource=jmeter/frontend/basiccheck.jmx --resourceUri=jmeter/basiccheck.jmx
    #keptn add-resource --project=easytravel --service=easytravel-frontend --stage=production --resource=jmeter/frontend/load.jmx --resourceUri=jmeter/load.jmx
    
    #keptn add-resource --project=easytravel --service=easytravel-backend --stage=production --resource=jmeter/backend/basiccheck.jmx --resourceUri=jmeter/basiccheck.jmx
    #keptn add-resource --project=easytravel --service=easytravel-backend --stage=production --resource=jmeter/backend/load.jmx --resourceUri=jmeter/load.jmx
    
    
    # add jmeter config for staging
    echo "load jmeter.conf.yaml"
    keptn add-resource --project=easytravel --service=easytravel-frontend --stage=staging --resource=jmeter/frontend/jmeter.conf.yaml --resourceUri=jmeter/jmeter.conf.yaml
    keptn add-resource --project=easytravel --service=easytravel-backend --stage=staging --resource=jmeter/backend/jmeter.conf.yaml --resourceUri=jmeter/jmeter.conf.yaml

    # add jmeter config for production
    keptn add-resource --project=easytravel --service=easytravel-frontend --stage=production --resource=jmeter/frontend/jmeter.conf.yaml --resourceUri=jmeter/jmeter.conf.yaml
    keptn add-resource --project=easytravel --service=easytravel-backend --stage=production --resource=jmeter/backend/jmeter.conf.yaml --resourceUri=jmeter/jmeter.conf.yaml
    
else 
    echo "The helmcharts for easytravel are not present"
fi 

