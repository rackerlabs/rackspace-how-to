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

PDR on AWS has two main componants that will need to be implemented in your AWS environment; the setup of the IDS appliance infrastructure and deployment of select vendor agents.

### Deployment of an IDS appliance infrastructure

To enable visibility of your AWS network we deploy IDS appliances to each VPC where you have EC2 instances being monitored by our Rackspace PDR teams.

#### IDS appliance platform requirements
Rackspace PDR uses either Cloud Formation or Terraform to deploy IDS appliances in AWS. Our current IDS appliances are provided by Alert Logics Threat Manager offering.

Our PDR teams deploy, manage and monitor your IDS Threat Manager appliances. Below are the platform requirements required by Rackspace PDR.

- Be a Rackspace AWS customer
- A minimum of two(for H/A) threat manager appliances per VPC contianing monitored instances.
- At least one threat manager per AZ containing monitored instances.
- Egress and Ingress firewall rules as defined in the sections below

##### For Rackspace manged AWS accounts
Work with your AWS support team to implement the standards outlined below. Be sure that ingress and egress requirements pass through any security WAFs or AWS gateway devices that sit in front of 0.0.0.0/0.

##### For self-managed AWS accounts
The Cloud Formation or Terraform templates you will be provided will create and managed IAM roles and Security Groups etc. that will aid you in the setup and configuration of the network configuration outloned below. However you may need to implement some additional network rules where it makes sense for your environment.

##### IDS appliance network configuration
In a default environment our AWS team will use our deployment tools to create and manage the security groups needed to deploy your platform. However for customers implementing custom routing or application firewalls etc. Use the data below to ensure your AWS platform conforms to our specficiations.

[Rackspace PDR Threat Manager Network Requirements](/how-to/rackspace-pdr-ids-networking/)

#### Additional info on IDS setup
For more details you may refer to the [Alert Logic upstream vendor documentation](https://docs.alertlogic.com/install/cloud/amazon-web-services-threat-manager-direct-windows.htm)

### Deployment of vendor agents

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
