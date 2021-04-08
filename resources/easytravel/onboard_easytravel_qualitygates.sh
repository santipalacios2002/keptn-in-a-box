#!/bin/bash -x

#If directory exists continue, otherwise exit
if [[ -d "easytravel-frontend" ]]; then

    # The context for this script needs to be in easytravel
    echo "Adding the SLI for the Project to all Stages"
    keptn add-resource --project=easytravel --resource=dynatrace-sli-config-easytravel.yaml --resourceUri=dynatrace/sli.yaml
      
    kubectl apply -f dynatrace-sli-config-easytravel.yaml
    
    keptn configure monitoring dynatrace --project=easytravel

    echo "Setting up QualityGate to Staging"
    #keptn add-resource --project=easytravel --stage=staging --service=easytravel-mongodb --resource=simple_slo.yaml --resourceUri=slo.yaml
    keptn add-resource --project=easytravel --stage=staging --service=easytravel-backend --resource=simple_slo.yaml --resourceUri=slo.yaml
    keptn add-resource --project=easytravel --stage=staging --service=easytravel-frontend --resource=simple_slo.yaml --resourceUri=slo.yaml
    keptn add-resource --project=easytravel --stage=staging --service=easytravel-www --resource=simple_slo.yaml --resourceUri=slo.yaml
    keptn add-resource --project=easytravel --stage=staging --service=easytravel-angular --resource=simple_slo.yaml --resourceUri=slo.yaml

    echo "Setting up QualityGate to Production"
    #keptn add-resource --project=easytravel --stage=production --service=easytravel-mongodb --resource=simple_slo.yaml --resourceUri=slo.yaml
    keptn add-resource --project=easytravel --stage=production --service=easytravel-backend --resource=simple_slo.yaml --resourceUri=slo.yaml
    keptn add-resource --project=easytravel --stage=production --service=easytravel-frontend --resource=simple_slo.yaml --resourceUri=slo.yaml
    keptn add-resource --project=easytravel --stage=production --service=easytravel-www --resource=simple_slo.yaml --resourceUri=slo.yaml 
    keptn add-resource --project=easytravel --stage=production --service=easytravel-angular --resource=simple_slo.yaml --resourceUri=slo.yaml    

else 
    echo "The helmcharts for easytravel are not present"
fi 

