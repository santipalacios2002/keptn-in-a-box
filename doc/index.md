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

<img src="images/usecase1.png" width="500"/>

### Deploy dtdemos/order-service:2 

Both these scenearios are enabled

<img src="images/usecase2.png" width="500"/>

and...

<img src="images/usecase3.png" width="500"/>

### Examine Dynatrace 

Now lets look at what we have discovered in Dynatrace.

Open Dynatrace and navigate to **Hosts** in the menu and select the host.

Here we can examine all the proceses automatically discovered by the Dynatrace oneAgent.

<img src="images/pre_host.png" width="400"/>

We can also see the processes for the order application.

<img src="images/pre_processes.png" width="300"/>

Next we can examine the Transactions and Services.

Select **Transactions and Services** from the menu.

<img src="images/pre_services.png" width="400"/>

You can also change the focus by using the _management zone_ filter.

Finally, we can also see how the KIAB configured Kubernetes cluster monitoring.

Select **Kubernetes** from the menu.

<img src="images/pre_kube.png" width="400"/>

Pre-configured items also include:

1. Dashboards
1. Request Attributes
1. Calculated Service Metrics
1. Management Zones
1. Automatically Applied Tags
1. Problem Notification
1. Process Group Naming Rule
1. Service Naming Rule

Now that we are more familiar with what we have running, Let's continue.

### [continue](https://github.com/jyarb-keptn/keptn-in-a-box/tree/release-0.8pre#3---understanding-and-setup-for-load-testing).


