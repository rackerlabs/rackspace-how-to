---
permalink: rackspace-pdr-dedicated-servers/
title: Rackspace PDR on Rackspace Dedicated Servers
type: article
audit_date: '2018-11-12'
created_date: '2018-10-11'
created_by: Nick Shobe
last_modified_date: '2018-12-06'
last_modified_by: Stephanie Fillmon
product: Rackspace Proactive Detection & Response
product_url: rackspace-pdr
---

Rackspace Proactive Detection & Response (PDR) on Rackspace Dedicated Servers is primarily managed and deployed by Rackspace
Support teams, however, there are a few things that ensure that your deployments go
smoothly: the Network-based Intrusion Detection (NIDS) appliance infrastructure must be
set up, and select vendor agents must be deployed.

### Deployment of an NIDS appliance infrastructure

To enable visibility of your network, we deploy NIDS appliances to each routable network
where you have servers being monitored by our Rackspace PDR teams.

#### NIDS appliance requirements

Our PDR and support teams deploy, manage, and monitor your NIDS appliances. Our current NIDS appliances are
provided by the Alert Logic&reg; Threat Manger&trade; offering. Rackspace PDR has the following
platform requirements:

- Be a Rackspace Dedicated customer.
- Set up egress and ingress firewall rules as defined in [Rackspace PDR Threat Manager Network Requirements](/how-to/rackspace-pdr-nids-networking/).

#### NIDS appliance network configuration

If you have self-managed networks or firewalls, use the
[Rackspace PDR Threat Manager Network Requirements](/how-to/rackspace-pdr-nids-networking/) to
implement appropriate firewall access control lists (ACLs) and routing to ensure proper opperation of
our NIDS appliances.

#### NIDS appliance end-to-end decryption

Many appliactions terminate Secure Socket Layer (SSL) and Transport Layer Security (TLS) at the network
edge with a load-balancer or web application firewall. If your application uses end-to-end encryption,
see the [Rackspace PDR SSL Decryption Guide](/how-to/rackspace-pdr-ssl-decryption/).

### Deployment of vendor agents

Individual PDR agents are deployed and maintained by the Rackspace PDR team. However, we do have
base requirements that must be met to ensure that our automated deployment system and PDR support team
can access your instances to deploy or troublshoot agents and systems.

Following these steps helps to ensure successful agent deployments:

- Deploy using operating systems and kernals compatible with Rackspace PDR.
- Ensure that you've implemented the appropriate network ACLs and firewall configurations.

#### Building compatable hosts

Due to the various vendors that we have selected to provide the nessessary telemetry to our systems, it is important
that you select operating systems and kernel versions that are compatable with the vendor agents. For more
information, see the [Rackspace PDR System Requirements](/how-to/rackspace-pdr-agent-compatibility/).

#### Golden or Base images

It is important that images taken from hosts that have Rackspace PDR agents deployed be prepared for deployment before using them as base images. Follow the [Rackspace PDR imaging hosts](/how-to/rackspace-pdr-imaging/) guide to ensure Golden images are properly prepared.

#### Remote management

Remote access is typically enabled and managed by your Rackspace support teams. We use Secure Shell (SSH) for
Linux&reg; systems and Windows&reg; Remote Management (WinRM) for Windows systems.

#### Instance network requirements

The agents that are used to provide telementry to our Security Operations Center (SOC) have specific networking
requirements that must be implemented. Use the
[Rackspace PDR Agent network requirements](/how-to/rackspace-pdr-agent-networking/) guide to
correctly implement network ACLs and firewall rules for your platform.

### Additional infomation

For more information on Threat Manager, see the [Alert Logic upstream vendor documentation](https://docs.alertlogic.com/install/cloud/amazon-web-services-threat-manager-direct-windows.htm).
