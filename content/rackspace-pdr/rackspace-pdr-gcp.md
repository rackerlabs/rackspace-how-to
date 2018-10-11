---
title: Rackspace PDR on GCP
type: article
created_date: '2018-10-11'
created_by: Nick Shobe
last_modified_date: '2018-10-11'
last_modified_by: Nick Shobe
permalink: rackspace-pdr-gcp/
product: Rackspace Proactive Detection & Response
product_url: rackspace-pdr
---

### Getting Started on GCP with Rackspace PDR

PDR on GCP has two main componants that will need to be implemented in your GCP environment; the setup of the IDS appliance infrastructure and deployment of select vendor agents.

### Deployment of an IDS appliance infrastructure

To enable visibility of your GCP network we deploy IDS appliances to each VPC where you have EC2 instances being monitored by our Rackspace PDR teams.

#### IDS appliance platform requirements
Rackspace PDR uses either Cloud Formation or Terraform to deploy IDS appliances in GCP. Our current IDS appliances are provided by Alert Logics Threat Manager offering.

Our PDR teams deploy, manage and monitor your IDS Threat Manager appliances. Below are the platform requirements required by Rackspace PDR.

- Be a Rackspace GCP customer
- Egress and Ingress firewall rules as defined in the sections below

Work with your GCP support team to implement the standards outlined below. Be sure that ingress and egress requirements pass through any security WAFs or gateway devices that sit in front of 0.0.0.0/0.

##### IDS appliance network configuration
In a default environment our GCP team will use our deployment tools to create and manage the network ACLs needed to configure your platform for Rackspace PDR. However for customers implementing custom routing or application firewalls etc. Use the data below to ensure your GCP deployment conforms to our specficiations.

[Rackspace PDR Threat Manager Network Requirements](/how-to/rackspace-pdr-ids-networking/)

#### Additional info on IDS setup
For more details you may refer to the [Alert Logic upstream vendor documentation](https://docs.alertlogic.com/install/cloud/amazon-web-services-threat-manager-direct-windows.htm)

### Deployment of vendor agents

Individual PDR agents are deployed and maintained by the Rackspace PDR team. However, we do have base requirements that must be met to ensure our automated deployment system and PDR Rackers can access your instances to deploy or troublshoot agents and systems.

**Please follow the steps outlined below, to ensure successful agent deployments**
- Deploy using Rackspace PDR compatable operating systems and kernels
- Ensure instances have the PDR deployment scripts at boot
- Ensure you've implemented the appropriate network ACLs and firewall configurations

#### Building compatable instances
Due to the various vendors we have selected to provide the nessessary telemetry to our systems. It is important that you select operating systems and kernel versions that are compatable with the vendors agents by follow this guide [Rackspace PDR System Requirements](/how-to/rackspace-pdr-agent-compatablity/).

#### Deployment boot script
Rackspace PDR on GCP uses a boot installation script to deploy and configure our vendor agents. We currently do not provide an alternative method for manually deploying agents on GCP, so proper configuration at boot is required to provision instances for GCP.

#### Instance network requirements
The agents used to provide telementry to our Security Operations Center do have specific networking requirements that must be implemented. Use the [Rackspace PDR Agent Network Requirements](/how-to/rackspace-pdr-agent-networking/) guide to correctly implement network ACLs and firewall rules for your platform.
