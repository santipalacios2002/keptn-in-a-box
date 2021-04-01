#!/bin/bash -x

#If directory exists continue, otherwise exit
if [[ -d "catalog" ]]; then

    # The context for this script needs to be in examples/onboarding-carts
    echo "Adding the SLI for the Project to all Stages"
    keptn add-resource --project=keptnorders --resource=dynatrace-sli-config-keptnorders.yaml --resourceUri=dynatrace/sli.yaml
      
    kubectl apply -f dynatrace-sli-config-keptnorders.yaml
    
    keptn configure monitoring dynatrace --project=keptnorders

    echo "Setting up QualityGate to Staging"
    keptn add-resource --project=keptnorders --stage=staging --service=order --resource=quality-gates/order/simple_slo.yaml --resourceUri=slo.yaml
    keptn add-resource --project=keptnorders --stage=staging --service=catalog --resource=quality-gates/catalog/simple_slo.yaml --resourceUri=slo.yaml
    keptn add-resource --project=keptnorders --stage=staging --service=customer --resource=quality-gates/customer/simple_slo.yaml --resourceUri=slo.yaml
    keptn add-resource --project=keptnorders --stage=staging --service=frontend --resource=quality-gates/frontend/simple_slo.yaml --resourceUri=slo.yaml
    echo "Setting up QualityGate to Production"
    keptn add-resource --project=keptnorders --stage=production --service=frontend --resource=quality-gates/frontend/simple_slo.yaml --resourceUri=slo.yaml
    keptn add-resource --project=keptnorders --stage=production --service=order --resource=quality-gates/order/simple_slo.yaml --resourceUri=slo.yaml
    keptn add-resource --project=keptnorders --stage=production --service=customer  --resource=quality-gates/customer/simple_slo.yaml --resourceUri=slo.yaml
    keptn add-resource --project=keptnorders --stage=production --service=catalog  --resource=quality-gates/catalog/simple_slo.yaml --resourceUri=slo.yaml

else 
    echo "The helmcharts for catalog are not present"
fi 

