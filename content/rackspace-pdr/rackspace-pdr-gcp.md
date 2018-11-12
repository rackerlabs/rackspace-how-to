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

PDR on GCP has two main componants that will need to be implemented in your GCP environment; the setup of the Network-based Intrusion Detection(NIDS) appliance infrastructure and deployment of select vendor agents.

### Deployment of an NIDS appliance infrastructure

To enable visibility of your GCP network we deploy and maintain NIDS infrastructure in to a Rackspace PDR "project" that is peered to your other projects.

#### NIDS appliance platform requirements
The Rackspace PDR and Rackspace GCP teams deploy and manage your GCP NIDS appliance infrastructure.

Our PDR teams deploy, manage and monitor your NIDS appliances. Below are the platform requirements required by Rackspace PDR.

- Be a Rackspace GCP customer
- Egress and Ingress firewall rules as defined in the sections below

If you have custom changes to your network envirnments, be sure to work with your GCP support team to implement them to comply with Rackspace PDR. Be sure that ingress and egress requirements pass through any security WAFs or gateway devices that sit in front of 0.0.0.0/0.

##### NIDS appliance network configuration

Rackspace PDR deployments require a separate project for the Rackspace PDR infrastructure. This project has its own Networks, isolated from the other projects and networks. Both of these networks use VPC Peering to provide connectivity with other projects.

The Rackspace PDR infrastructure project consists of, at a minimum, of two NIDS appliances per GCP Region in use for high availability(HA).

Due to GDPR, EU regions will require a separate HA pair of the NIDS's. Firewall rules ensure connectivity between EU and US is blocked for Compliance with GDPR.

[Rackspace PDR Threat Manager Network Requirements](/how-to/rackspace-pdr-nids-networking/)

##### NIDS appliance end-to-end decryption
Many appliactions terminate SSL/TLS at the network edge with load-balancer or web application firewall. However, if your application uses end-to-end encryption follow the [Rackspace PDR SSL Decryption Guide](/how-to/rackspace-pdr-ssl-decryption/).

#### Additional info on NIDS setup
For more details you may refer to the [Alert Logic upstream vendor documentation](https://docs.alertlogic.com/install/cloud/amazon-web-services-threat-manager-direct-windows.htm)

### Deployment of vendor agents

Individual PDR agents are deployed and maintained by the Rackspace PDR team. However, we do have base requirements that must be met to ensure our automated deployment system and PDR Rackers can access your instances to deploy or troublshoot agents and systems.

**Follow these steps to ensure successful agent deployments**

- Deploy using Rackspace PDR compatable operating systems and kernels
- Ensure instances have the PDR deployment scripts at boot
- Ensure you've implemented the appropriate network ACLs and firewall configurations

#### Building compatable instances
Due to the various vendors we have selected to provide the nessessary telemetry to our systems. It is important that you select operating systems and kernel versions that are compatable with the vendors agents by follow this guide [Rackspace PDR System Requirements](/how-to/rackspace-pdr-agent-compatablity/).

#### Deployment boot script
Rackspace PDR on GCP uses a boot installation script to deploy and configure our vendor agents. We currently do not provide an alternative method for manually deploying agents on GCP, so proper configuration at boot is required to provision instances for Rackspace PDR.

#### Instance network requirements
The agents used to provide telementry to our Security Operations Center do have specific networking requirements that must be implemented. Use the [Rackspace PDR Agent Network Requirements](/how-to/rackspace-pdr-agent-networking/) guide to correctly implement network ACLs and firewall rules for your platform.
