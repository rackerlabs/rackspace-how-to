---
title: Rackspace PDR on Azure
type: article
created_date: '2018-10-09'
created_by: Nick Shobe
last_modified_date: '2018-10-09'
last_modified_by: Nick Shobe
permalink: rackspace-pdr-azure/
product: Rackspace Proactive Detection & Response
product_url: rackspace-pdr
---

### Getting Started on Azure with Rackspace PDR

PDR on Azure has two main componants that will need to be implemented in your Azure environment; the setup of the IDS appliance infrastructure and deployment of select vendor agents.

### Deployment of an IDS appliance infrastructure

To enable visibility of your Azure network we deploy an IDS appliance into each distinct network environment.

#### IDS appliance platform requirements
At this time the Rackspace Azure and PDR support teams deploy, manage and monitor your IDS Threat Manager appliances. Below are the platform requirements required by Rackspace PDR on Azure.

- Be a Rackspace Azure customer
- An IDS appliance for each routable network segment(appliance needs to be reachable by agents and visa versa)
- Egress and Ingress firewall rules(NSGs) as defined by [Rackspace PDR Threat Manager Network Requirements](/how-to/rackspace-pdr-ids-networking/)

### Deployment of vendor agents

Individual PDR agents are deployed and maintained by the Rackspace PDR team. However, we do have base requirements that must be met to ensure our automated deployment system and PDR Rackers can access your instances to deploy or troublshoot agents and systems.

#### Ensure VM images have the Azure VM Agent

- [Azure VM Agent for Windows](https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/agent-windows)
- [Azure VM Agent for Linux](https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/agent-linux)

#### Building compatable instances
Due to the various vendors we have selected to provide the nessessary telemetry to our systems. It is important that you select operating systems and kernel versions that are compatable with the vendors agents by follow this guide [Rackspace PDR System Requirements](/how-to/rackspace-pdr-agent-compatablity/).

#### Instance network requirements
The agents used to provide telementry to our Security Operations Center do have specific networking requirements that must be implemented. Use the [Rackspace PDR Agent Network Requirements](/how-to/rackspace-pdr-agent-networking/) guide to correctly implement network ACLs and firewall rules for your platform.
