## Application Overview and Problem Scenerios


### Order App Overview

This application was built for demonstations of Dynatrace.  The front-end look like this.

<img src="images/orders.png" width="300"/>

The overall application is made up of four Docker components: a frontend web UI and 3 backend services.  Once monitored by Dynatrace, a multi-tier call flow will be available such as shown below.

<img src="images/dt-call-flow.png" width="500"/>

#### Pre-built Docker Images

The dt-orders application has pre-built problems programmed within different versions.  See source in the [dt-orders repo](https://github.com/dt-orders).  Each version for each service, has pre-built docker images that are published to [dockerhub](https://hub.docker.com/u/dtdemos).

This is a summary of the versions followed by a description of the problem scenarios.

| Service  | Branch/Docker Tag | Description |
|---|:---:|---|
| frontend | 1 | Normal behavior |
| catalog-service | 1 | Normal behavior |
| customer-service | 1 | Normal behavior |
| order-service | 1 | Normal behavior |
| customer-service | 2 | High Response time for /customer/list.html |
| order-service | 2 | 50% exception for /order/line URL and n+1 back-end calls for /order/form.html |
| customer-service | 3 | Normal behavior |
| order-service | 3 | Normal behavior |

### Problem Scenarios

#### Deploy dtdemos/customer-service:2

<img src="../../assets/images/usecase1.png" width="500"/>

### Deploy dtdemos/order-service:2 

Both these scenearios are enabled

<img src="../../assets/images/usecase2.png" width="500"/>

and...

<img src="../../assets/images/usecase3.png" width="500"/>

### Examine Dynatrace 

Now lets look at what we have discovered in Dynatrace.

Open Dynatrace and navigate to **Hosts** in the menu and select the host.

Here we can examine all the proceses automatically discovered by the Dynatrace oneAgent.

<img src="../../assets/images/pre_host.png" width="400"/>

We can also see the processes for the order application.

<img src="../../assets/images/pre_processes.png" width="300"/>

Next we can examine the Transactions and Services.

Select **Transactions and Services** from the menu.

<img src="../../assets/images/pre_services.png" width="400"/>

You can also change the focus by using the _management zone_ filter.

Finally, we can also see how the KIAB configured Kubernetes cluster monitoring.

Select **Kubernetes** from the menu.

<img src="../../assets/images/pre_kube.png" width="400"/>

Pre-configured items also include:

1. Dashboards
1. Request Attributes
1. Calculated Service Metrics
1. Management Zones
1. Automatically Applied Tags

Now that we are more familiar with what we have running, let's continue to the next activity.

### Troubleshooting

If you need to rebuild the environment, follow these steps.

```bash
cd ~/keptn-in-a-box
```

This script will reset the Ubuntu instance by removing Kubernetes and the Dynatrace ActiveGate.

```bash
./resetenv.sh
```

Now we need to re-initialize the environment.

Run the following commands, then follow the process from above.
    
```bash
cd ~
sudo bash -c './keptn-in-a-box.sh'
```

