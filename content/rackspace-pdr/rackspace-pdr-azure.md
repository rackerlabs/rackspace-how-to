---
permalink: rackspace-pdr-azure/
title: Rackspace PDR on Azure
type: article
audit_date: '2018-11-12'
created_date: '2018-10-09'
created_by: Nick Shobe
last_modified_date: '2018-12-06'
last_modified_by: Stephanie Fillmon
product: Rackspace Proactive Detection & Response
product_url: rackspace-pdr
---

Rackspace Proactive Detection & Response (PDR) on Microsoft&reg; Azure&reg; has two main components that
must be implemented in your Azure environment: the Network-based Intrusion Detection (NIDS) appliance
infrastructure must be set up, and select vendor agents must be deployed.

### Deployment of an NIDS appliance infrastructure

To enable visibility of your Azure network, we deploy NIDS appliances into each distinct network environment.

#### NIDS appliance platform requirements

At this time, the Rackspace Azure and PDR support teams deploy, manage, and monitor your
NIDS appliances. Our current NIDS appliances are provide by the Alert Logic&reg; Threat Manger&trade; offering. Rackspace PDR has the following platform requirements:

- Be a Rackspace Azure customer.
- Have an NIDS appliance for each routable network segment (appliance needs to be reachable by agents and visa versa).
- Set up egress and ingress firewall rules (NSGs) as defined in [Rackspace PDR Threat Manager Network Requirements](/how-to/rackspace-pdr-nids-networking/).

#### Secure Socket Layer (SSL) appliance end-to-end decryption

Many appliactions terminate SSL and Transport Layer Security (TLS) at the network edge with a load-balancer
or web application firewall. If your application uses end-to-end encryption, see the
[Rackspace PDR SSL Decryption Guide](/how-to/rackspace-pdr-ssl-decryption/).

### Deployment of vendor agents

Individual PDR agents are deployed and maintained by the Rackspace PDR team. However, we do have base
requirements that must be met to ensure that our automated deployment system and PDR support team can access
your instances to deploy or troublshoot agents and systems.

Ensure that your virtual machine (VM) images have the Azure Virtual Machine Agent (VM Agent). See the following
documentation for more information on installing the VM Agent:

- [Azure VM Agent for Windows](https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/agent-windows)
- [Azure VM Agent for Linux](https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/agent-linux)

#### Building compatible instances

Due to the various vendors that we have selected to provide the nessessary telemetry to our systems, it is
important that you select operating systems and kernel versions that are compatable with the
vendor agents. For more information, see the [Rackspace PDR system requirements](/how-to/rackspace-pdr-agent-compatibility/).

#### Golden or Base images

It is important that images taken from hosts that have Rackspace PDR agents deployed be prepared for deployment before using them as base images. Follow the [Rackspace PDR imaging hosts](/how-to/rackspace-pdr-imaging/) guide to ensure that Golden images are properly prepared.

#### Instance network requirements

The agents used to provide telementry to our Security Operations Center (SOC) do have specific networking
requirements that must be implemented. Use the
[Rackspace PDR Agent network requirements](/how-to/rackspace-pdr-agent-networking/) guide to correctly
implement network ACLs and firewall rules for your platform.
