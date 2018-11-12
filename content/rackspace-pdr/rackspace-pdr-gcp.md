---
permalink: rackspace-pdr-gcp/
title: Rackspace PDR on Google Cloud Platform
type: article
audit_date: '2018-11-12'
created_date: '2018-10-11'
created_by: Nick Shobe
last_modified_date: '2018-11-12'
last_modified_by: Nick Shobe
permalink: rackspace-pdr-gcp/
product: Rackspace Proactive Detection & Response
product_url: rackspace-pdr
---

Rackspace PDR on Google Cloud Platform&trade; (GCP) has two main componants that need to be implemented in
your GCP environment: the Network-based Intrusion Detection (NIDS) appliance infrastructure
must be set up, and select vendor agents must be deployed.

### Deployment of an NIDS appliance infrastructure

To enable visibility of your GCP network we deploy NIDS to a special PDR project that has

#### NIDS appliance platform requirements

The Rackspace PDR and Rackspace GCP teams deploy and manage your GCP NIDS appliance infrastructure.

Our PDR teams deploy, manage and monitor your NIDS appliances. Following are the platform requirements
required by Rackspace PDR:

- Be a Rackspace GCP customer
- Egress and Ingress firewall rules as defined in the sections below

If you have custom changes to your network envirnments, be sure to work with your GCP support team
to implement them to comply with Rackspace PDR. Be sure that ingress and egress requirements
pass through any security web application firewalls (WAFs) or gateway devices that sit in front of 0.0.0.0/0.

#### NIDS appliance network configuration

Rackspace PDR deployments require a separate project for the Rackspace PDR infrastructure. This
project has its own networks that are isolated from the other projects and networks. Both of
these networks use Amazon&reg; Virtual Private Cloud&reg; (VPC) Peering to provide connectivity with other projects.

The Rackspace PDR infrastructure project consists of, at a minimum, two NIDS appliances per GCP Region in
use for high availability (HA).

Due to the General Data Protection Regulation (GDPR), European Union (EU) regions require a
separate HA pair of NIDS appliances. Firewall rules ensure that connectivity between the EU and the
United States is blocked for compliance with GDPR.

For more information, see [Rackspace PDR Threat Manager Network Requirements](/how-to/rackspace-pdr-nids-networking/).

#### NIDS appliance end-to-end decryption

Many appliactions terminate Secure Socket Layer (SSL) and Transport Layer Security (TLS) at the network
edge with aload-balancer or web application firewall. If your application uses end-to-end encryption, see
the [Rackspace PDR SSL Decryption Guide](/how-to/rackspace-pdr-ssl-decryption/).

### Deployment of vendor agents

Individual PDR agents are deployed and maintained by the Rackspace PDR team. However, we do have base
requirements that must be met to ensure that our automated deployment system and PDR support team can access
your instances to deploy or troublshoot agents and systems.

Following these steps will help ensure successful agent deployments:

- Deploy using operating systems and kernals compatible with Rackspace PDR
- Ensure that instances have the PDR deployment scripts at boot
- Ensure that you've implemented the appropriate network access control lists (ACLs) and firewall configurations

#### Building compatable instances

Due to the various vendors we have selected to provide the nessessary telemetry to our systems, it is
important that you select operating systems and kernel versions that are compatable with the vendor agents. For
more information, see the [Rackspace PDR System Requirements](/how-to/rackspace-pdr-agent-compatablity/).

#### Deployment boot script

Rackspace PDR on GCP uses a boot installation script to deploy and configure our vendor agents. We
currently do not provide an alternative method for manually deploying agents on GCP, so proper
configuration at boot is required to provision instances for Rackspace PDR.

#### Instance network requirements

The agents used to provide telementry to our Security Operations Center (SOC) have specific networking
requirements that must be implemented. Use the
[Rackspace PDR Agent Network Requirements](/how-to/rackspace-pdr-agent-networking/) guide to
correctly implement network ACLs and firewall rules for your platform.

### Additional information

For more information on the Threat Manager offering, see the [Alert Logic upstream vendor documentation](https://docs.alertlogic.com/install/cloud/amazon-web-services-threat-manager-direct-windows.htm).
