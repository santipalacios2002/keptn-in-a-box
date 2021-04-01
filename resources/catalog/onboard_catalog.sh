#!/bin/bash -x

#If directory exists continue, otherwise exit
if [[ -d "catalog" ]]; then
    
    # The context for this script needs to be in examples/onboarding-carts
    echo "load shipyard.yaml"
    keptn create project keptnorders --shipyard=./shipyard.yaml
    keptn add-resource --project=keptnorders --resource=./shipyard.yaml --resourceUri=shipyard.yaml
    # Onboarding - prepare  Keptn
    echo "onboard services"
    keptn onboard service order --project=keptnorders --chart=./order
    keptn onboard service catalog --project=keptnorders --chart=./catalog
    keptn onboard service customer --project=keptnorders --chart=./customer
    keptn onboard service frontend --project=keptnorders --chart=./frontend
    
    # add jmeter resources for staging
    echo "load for project"
    #keptn add-resource --project=keptnorders --resource=jmeter/basiccheck.jmx --resourceUri=jmeter/basiccheck.jmx
    #keptn add-resource --project=keptnorders --resource=jmeter/jmeter.conf.yaml --resourceUri=jmeter/jmeter.conf.yaml
    echo "load service level jmeter scripts-staging"
    keptn add-resource --project=keptnorders --service=frontend --stage=staging --resource=jmeter/frontend/basiccheck.jmx --resourceUri=jmeter/basiccheck.jmx
    keptn add-resource --project=keptnorders --service=frontend --stage=staging --resource=jmeter/frontend/frontend-load.jmx --resourceUri=jmeter/frontend-load.jmx
    
    keptn add-resource --project=keptnorders --service=customer --stage=staging --resource=jmeter/customer/basiccheck.jmx --resourceUri=jmeter/basiccheck.jmx
    keptn add-resource --project=keptnorders --service=customer --stage=staging --resource=jmeter/customer/customer-load.jmx --resourceUri=jmeter/customer-load.jmx
    
    keptn add-resource --project=keptnorders --service=catalog --stage=staging --resource=jmeter/catalog/basiccheck.jmx --resourceUri=jmeter/basiccheck.jmx
    keptn add-resource --project=keptnorders --service=catalog --stage=staging --resource=jmeter/catalog/catalog-load.jmx --resourceUri=jmeter/catalog-load.jmx    
    
    keptn add-resource --project=keptnorders --service=order --stage=staging --resource=jmeter/order/basiccheck.jmx --resourceUri=jmeter/basiccheck.jmx
    keptn add-resource --project=keptnorders --service=order --stage=staging --resource=jmeter/order/order-load.jmx --resourceUri=jmeter/order-load.jmx    
    
    # add jmeter resources for production
    echo "load service level jmeter scripts-production"
    keptn add-resource --project=keptnorders --service=frontend --stage=production --resource=jmeter/frontend/basiccheck.jmx --resourceUri=jmeter/basiccheck.jmx
    keptn add-resource --project=keptnorders --service=frontend --stage=production --resource=jmeter/frontend/frontend-load.jmx --resourceUri=jmeter/frontend-load.jmx
    
    keptn add-resource --project=keptnorders --service=customer --stage=production --resource=jmeter/customer/basiccheck.jmx --resourceUri=jmeter/basiccheck.jmx
    keptn add-resource --project=keptnorders --service=customer --stage=production --resource=jmeter/customer/customer-load.jmx --resourceUri=jmeter/customer-load.jmx
    
    keptn add-resource --project=keptnorders --service=catalog --stage=production --resource=jmeter/catalog/basiccheck.jmx --resourceUri=jmeter/basiccheck.jmx
    keptn add-resource --project=keptnorders --service=catalog --stage=production --resource=jmeter/catalog/catalog-load.jmx --resourceUri=jmeter/catalog-load.jmx
    
    keptn add-resource --project=keptnorders --service=order --stage=production --resource=jmeter/order/basiccheck.jmx --resourceUri=jmeter/basiccheck.jmx
    keptn add-resource --project=keptnorders --service=order --stage=production --resource=jmeter/order/order-load.jmx --resourceUri=jmeter/order-load.jmx
    
    # add jmeter config for staging
    echo "load jmeter.conf.yaml"
    keptn add-resource --project=keptnorders --service=order --stage=staging --resource=jmeter/order/jmeter.conf.yaml --resourceUri=jmeter/jmeter.conf.yaml
    keptn add-resource --project=keptnorders --service=customer --stage=staging --resource=jmeter/customer/jmeter.conf.yaml --resourceUri=jmeter/jmeter.conf.yaml
    keptn add-resource --project=keptnorders --service=catalog --stage=staging --resource=jmeter/catalog/jmeter.conf.yaml --resourceUri=jmeter/jmeter.conf.yaml
    keptn add-resource --project=keptnorders --service=frontend --stage=staging --resource=jmeter/frontend/jmeter.conf.yaml --resourceUri=jmeter/jmeter.conf.yaml
    # add jmeter config for production
    keptn add-resource --project=keptnorders --service=order --stage=production --resource=jmeter/order/jmeter.conf.yaml --resourceUri=jmeter/jmeter.conf.yaml
    keptn add-resource --project=keptnorders --service=customer --stage=production --resource=jmeter/customer/jmeter.conf.yaml --resourceUri=jmeter/jmeter.conf.yaml
    keptn add-resource --project=keptnorders --service=catalog --stage=production --resource=jmeter/catalog/jmeter.conf.yaml --resourceUri=jmeter/jmeter.conf.yaml
    keptn add-resource --project=keptnorders --service=frontend --stage=production --resource=jmeter/frontend/jmeter.conf.yaml --resourceUri=jmeter/jmeter.conf.yaml    
else 
    echo "The helmcharts for catalog are not present"
fi 

