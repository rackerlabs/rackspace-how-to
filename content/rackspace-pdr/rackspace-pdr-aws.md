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

### Getting Started on AWS with Rackspace PDR

PDR on AWS has two main componants that will need to be implemented in your AWS environment; the setup of the Network-based Intrusion Detection(NIDS) appliance infrastructure and deployment of select vendor agents.

### Deployment of an NIDS appliance infrastructure

To enable visibility of your AWS network we deploy NIDS appliances to each VPC where you have EC2 instances being monitored by our Rackspace PDR teams.

#### NIDS appliance platform requirements
Rackspace PDR uses either Cloud Formation or Terraform to deploy NIDS appliances in AWS. Our current NIDS appliances are provided by Alert Logics Threat Manager offering.

Our PDR teams deploy, manage and monitor your NIDS Threat Manager appliances. Below are the platform requirements required by Rackspace PDR.

- Be a Rackspace AWS customer
- A minimum of two(for H/A) threat manager appliances per VPC contianing monitored instances.
- At least one threat manager per AZ containing monitored instances
- Egress and Ingress firewall rules as defined in the sections below

##### For Rackspace manged AWS accounts
Work with your AWS support team to implement the standards outlined below. Be sure that ingress and egress requirements pass through any security WAFs or AWS gateway devices that sit in front of 0.0.0.0/0.

##### For self-managed AWS accounts
The Cloud Formation or Terraform templates you will be provided will create and managed IAM roles and Security Groups etc. that will aid you in the setup and configuration of the network configuration outloned below. However you may need to implement some additional network rules where it makes sense for your environment.

##### NIDS appliance network configuration
In a default environment our AWS team will use our deployment tools to create and manage the security groups needed to deploy your platform. However for customers implementing custom routing or application firewalls etc. Use the data below to ensure your AWS platform conforms to our specficiations.

[Rackspace PDR Threat Manager Network Requirements](/how-to/rackspace-pdr-nids-networking/)

##### NIDS appliance end-to-end decryption
Many appliactions terminate SSL/TLS at the network edge with load-balancer or web application firewall. However, if your application uses end-to-end encryption follow the [Rackspace PDR SSL Decryption Guide](/how-to/rackspace-pdr-ssl-decryption/).

#### Additional info on NIDS setup
For more details you may refer to the [Alert Logic upstream vendor documentation](https://docs.alertlogic.com/install/cloud/amazon-web-services-threat-manager-direct-windows.htm)

### Deployment of vendor agents

Individual PDR agents are deployed and maintained by the Rackspace PDR team. However, we do have base requirements that must be met to ensure our automated deployment system and PDR Rackers can access your instances to deploy or troublshoot agents and systems.

**Please follow the steps outlined below, to ensure successful agent deployments**
- Deploy using Rackspace PDR compatable operating systems and kernels
- Install the Amazon System Manager Agent
- Ensure you've implemented the appropriate network ACLs and firewall configurations

#### Building compatable instances
Due to the various vendors we have selected to provide the nessessary telemetry to our systems. It is important that you select operating systems and kernel versions that are compatable with the vendors agents by follow this guide [Rackspace PDR System Requirements](/how-to/rackspace-pdr-agent-compatablity/).

#### Amazon System Manager Agent
The current requirement for all AWS environments is to have the AWS Systems Manager Agent (SSM Agent) installed and configured on all Rackspace PDR monitored instnaces. This enables our select vendor agent deployment platform as well as our security operations Rackers to perform nessessary actions against your infrastructure. The AWS documentation covers how to the [Install AWS Systems Manager Agent (SSM Agent)](https://docs.aws.amazon.com/systems-manager/latest/userguide/ssm-agent.html) in more detail.

#### Instance network requirements
The agents used to provide telementry to our Security Operations Center do have specific networking requirements that must be implemented. Use the [Rackspace PDR Agent Network Requirements](/how-to/rackspace-pdr-agent-networking/) guide to correctly implement network ACLs and firewall rules for your platform.
