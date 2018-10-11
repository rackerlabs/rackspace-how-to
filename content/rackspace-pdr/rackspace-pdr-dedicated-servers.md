---
title: Rackspace PDR on Rackspace Dedicated Servers
type: article
created_date: '2018-10-11'
created_by: Nick Shobe
last_modified_date: '2018-10-11'
last_modified_by: Nick Shobe
permalink: rackspace-pdr-gcp/
product: Rackspace Proactive Detection & Response
product_url: rackspace-pdr
---

### Getting started on Rackspace dedicated servers with Rackspace PDR

PDR on Rackspace dedicated servers is primarily managed and deployed by Rackspace Support teams, however, there are a few things that will ensure your deployments will go smoothly. The deployment process consists of deployment of IDS appliances and vendor agents that provide telemetry.

### Deployment of an IDS appliance infrastructure

To enable visibility of your network we deploy IDS appliances to each routable network where you have servers being monitored by our Rackspace PDR teams.

#### IDS appliance requirements

Our PDR and support teams deploy, manage and monitor your IDS Threat Manager appliances. Below are the platform requirements required by Rackspace PDR.

- Be a Rackspace Dedicated customer
- Egress and Ingress firewall rules as defined in the sections below

##### IDS appliance network configuration
If you have self managed networks or firewalls etc. use the [Rackspace PDR Threat Manager Network Requirements](/how-to/rackspace-pdr-ids-networking/) to implement appropriate firewall ACLs and routing to ensure proper opperation of our IDS appliances.

#### Additional info on IDS setup
For more details you may refer to the [Alert Logic upstream vendor documentation](https://docs.alertlogic.com/install/cloud/amazon-web-services-threat-manager-direct-windows.htm)

### Deployment of vendor agents

Individual PDR agents are deployed and maintained by the Rackspace PDR team. However, we do have base requirements that must be met to ensure our automated deployment system and PDR Rackers can access your instances to deploy or troublshoot agents and systems.

**Please follow the steps outlined below, to ensure successful agent deployments**
- Deploy using Rackspace PDR compatable operating systems and kernels
- Ensure you've implemented the appropriate network ACLs and firewall configurations

#### Building compatable instances
Due to the various vendors we have selected to provide the nessessary telemetry to our systems. It is important that you select operating systems and kernel versions that are compatable with the vendors agents by follow this guide [Rackspace PDR System Requirements](/how-to/rackspace-pdr-agent-compatablity/).

#### Remote management
Remote access is typically enabled and managed by your Rackspace support teams, but the general idea is we use SSH for Linux and Winrm for Windows systems.

#### Instance network requirements
The agents used to provide telementry to our Security Operations Center do have specific networking requirements that must be implemented. Use the [Rackspace PDR Agent Network Requirements](/how-to/rackspace-pdr-agent-networking/) guide to correctly implement network ACLs and firewall rules for your platform.
