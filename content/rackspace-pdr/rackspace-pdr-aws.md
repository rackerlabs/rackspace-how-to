---
title: Rackspace PDR on AWS
type: article
created_date: '2018-10-08'
created_by: Nick Shobe
last_modified_date: '2018-10-08'
last_modified_by: Nick Shobe
permalink: rackspace-pdr-aws/
product: Rackspace Proactive Detection & Response
product_url: rackspace-pdr
---

# Getting Started on AWS with Rackspace PDR

PDR on AWS has two main componants that will need to be implemented in your AWS environment; the setup of the IDS appliance infrastructure and deployment of select vendor agents.

# Deployment of an IDS appliance infrastructure

To enable visibility of your AWS network we deploy IDS appliances to each VPC where you have EC2 instances being monitored by our Rackspace PDR teams.

## IDS appliance platform requirements

Rackspace PDR uses either Cloud Formation or Terraform to deploy IDS appliances. Our current IDS appliances are provided by Alert Logics Threat Manager offering.

Our PDR teams deploy, manage and monitor your IDS Threat Manager appliances. Below are the platform requirements needed to successfully deploy our IDS appliances.

- Be a Rackspace AWS customer
- A minimum of two(for H/A) threat manager appliances per VPC contianing monitored instances.
- At least one threat manager per AZ containing monitored instances.
- Egress and Ingress firewall rules as defined below

### For Rackspace manged AWS accounts
Work with your AWS support team to implement the standards outlined below. Be sure that ingress and egress requirements pass through any security WAFs or AWS gateway devices that sit in front of 0.0.0.0/0.

### For self-managed AWS accounts
The Cloud Formation or Terraform templates you will be provided will create and managed IAM roles and Security Groups etc. that will aid you in the setup and configuration of the network configuration outloned below. However you may need to implement some additional network rules where it makes sense for your environment.

### IDS appliance network configuration
In a default environment our AWS team will use our deployment tools to create and manage the security groups needed to deploy your platform. However for customers implementing custom routing or application firewalls etc. Use the data below to ensure your AWS platform conforms to our specficiations.

**Ingress Requirements to the Threat Manager Appliances**

| Source | Destination | Protocol | Port | Description |
| ------ | ----------- | -------- | ---- | ----------- |
| *Agent(s) CIDR* | Appliance | TCP | 443 | Agent updates |
| *Agent(s) CIDR* | Appliance | TCP | 7777 | Agent data transport (between agent and appliance on local network) |
| 208.71.209.32/27 | Appliance | TCP | 22 | *Optional and temporary- required for troubleshooting during provisioning only* |
| 204.110.218.96/27 | Appliance | TCP | 22 | *Optional and temporary- required for troubleshooting during provisioning only* |
| 204.110.219.96/27 | Appliance | TCP | 22 | *Optional and temporary- required for troubleshooting during provisioning only* |
| *185.54.124.0/24* | Appliance | TCP | 22 | **Optional** *EU Alert Logic Datacenter as derected by your PDR team and temporary- required for troubleshooting during provisioning only* |

**Egress Requirements from the Threat Manager Appliances**

*standard US Alert Logic Datacenter*

| Source | Destination | Protocol | Port | Description |
| ------ | ----------- | -------- | ---- | ----------- |
| Appliance | 8.8.4.4 | TCP/UDP | 53 | DNS |
| Appliance | 8.8.8.8 | TCP/UDP | 53 | DNS |
| Appliance | 0.0.0.0/0 TCP | 80 | Appliance updates |
| Appliance | 204.110.218.96/27 | TCP | 443 Updates |
| Appliance | 204.110.219.96/27 | TCP | 443 Updates |
| Appliance | 208.71.209.32/27 | TCP | 443 Updates |
| Appliance | 208.71.209.32/27 | TCP | 4138 Event transport |
| Appliance | 204.110.218.96/27 | TCP | 4138 Event transport |
| Appliance | 204.110.219.96/27 | TCP | 4138 Event transport |
| Appliance | 204.110.219.96/27 | UDP | 123 NTP, time sync |
| Appliance | 208.71.209.32/27 | UDP | 123 NTP, time sync |

**Egress Requirements from the Threat Manager Appliances standard EU Alert Logic Datacenter**

*Only implemented when instructed by your PDR team*

| Source | Destination | Protocol | Port | Description |
| ------ | ----------- | -------- | ---- | ----------- |
| Appliance | 185.54.124.0/24 | TCP | 443 | Updates |
| Appliance | 185.54.124.0/24 | TCP | 4138 | Event transport |
| Appliance | 8.8.8.8 | TCP/UDP | 53 | DNS |
| Appliance | 8.8.4.4 | TCP/UDP | 53 | DNS |
| Appliance | 0.0.0.0/0 | TCP | 80 | Appliance updates |
| Appliance | 185.54.124.0/24 | UDP | 123 | NTP, time sync |

### Additional info on IDS setup
For more details you may refer to the [Alert Logic upstream vendor documentation](https://docs.alertlogic.com/install/cloud/amazon-web-services-threat-manager-direct-windows.htm)

## Deployment of select vendor agents

The current requirement for all AWS environments is to have the AWS Systems Manager Agent (SSM Agent) installed and configured on all Rackspace PDR monitored instnaces. This enables our select vendor agent deployment platform as well as our security oporations Rackers to perform nessessary actions against your infrastructure.

[Install AWS Systems Manager Agent (SSM Agent)](https://docs.aws.amazon.com/systems-manager/latest/userguide/ssm-agent.html)
