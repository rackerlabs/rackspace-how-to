---
permalink: rackspace-pdr-aws/
title: Rackspace PDR on AWS
type: article
audit_date: '2018-11-12'
created_date: '2018-10-08'
created_by: Nick Shobe
last_modified_date: '2018-11-12'
last_modified_by: Nick Shobe
product: Rackspace Proactive Detection & Response
product_url: rackspace-pdr
---

Rackspace PDR on Amazon Web Services&reg; (AWS) has two main componants that need to be implemented
in your AWS environment: the Network-based Intrusion Detection (NIDS) appliance
infrastructure must be set up, and select vendor agents must be deployed.

### Deployment of an NIDS appliance infrastructure

To enable visibility of your AWS network, we deploy NIDS appliances to each Amazon Virtual Private Cloud&reg; (VPC)
where you have Amazon Elasic Compute Cloud&reg; (EC2) instances being monitored by our Rackspace PDR teams.

#### NIDS appliance platform requirements

Rackspace PDR uses either Amazon CloudFormation&reg; or HashiCorp&reg; Terraform&reg; to deploy NIDS appliances
in AWS. Our current NIDS appliances are provided by the Alert Logic&reg; Threat Manager&trade; offering.

Our PDR teams deploy, manage, and monitor your NIDS Threat Manager appliances. Rackspace PDR requires the
following platform requirements:

- Be a Rackspace AWS customer
- A minimum of two (for H/A) threat manager appliances per VPC containing monitored instances
- At least one NIDS per AZ containing monitored instances
- PDR covered VPCs must be configured with a private subnet and NAT gateway routing to 0.0.0.0/0, even for
  subnets configured with public IP assignment. NIDS appliances are never assigned public IPs and should be able to reach
  instances on their private addresses.
- Egress and Ingress firewall rules as defined in [Rackspace PDR Threat Manager Network Requirements](/how-to/rackspace-pdr-nids-networking/)

##### For Rackspace manged AWS accounts

Work with your AWS support team to implement the standards outlined below. Be sure that ingress and egress
requirements pass through any security WAFs or AWS gateway devices that sit in front of 0.0.0.0/0.

##### For self-managed AWS accounts

The CloudFormation or Terraform templates you will be provided create and manage IAM roles, Security
Groups, and so on that will aid you in the set up and configuration of the network configuration
outloned below. You might need to implement some additional network rules where it makes sense for your environment.

#### NIDS appliance network configuration

In a default environment, our AWS team uses our deployment tools to create and manage the security groups
needed to deploy your platform. For customers implementing custom routing or application
firewalls see [Rackspace PDR Threat Manager Network Requirements](/how-to/rackspace-pdr-nids-networking/) to
ensure that your AWS platform conforms to our specifications.

#### NIDS appliance end-to-end decryption

Many appliactions terminate Secure Socket Layer (SSL) and Transport Layer Security (TLS) at the network
edge with a load-balancer or web application firewall. If your application uses end-to-end encryption
see the [Rackspace PDR SSL Decryption Guide](/how-to/rackspace-pdr-ssl-decryption/).

### Deployment of vendor agents

Individual PDR agents are deployed and maintained by the Rackspace PDR team. However, we do have
base requirements that must be met to ensure that our automated deployment system and PDR support team
can access your instances to deploy or troublshoot agents and systems.

Following these steps will help ensure successful agent deployments:

- Deploy using operating systems and kernals compatible with Rackspace PDR
- Install the Amazon Systems Manager Agent&reg; (SSM Agent)
- Ensure that you've implemented the appropriate network access control lists (ACLs) and firewall configurations

#### Building compatable instances

Due to the various vendors we have selected to provide the nessessary telemetry to our systems, it is
important that you select operating systems and kernel versions that are compatable with the vendor
agents. For more information, see the [Rackspace PDR System Requirements](/how-to/rackspace-pdr-agent-compatablity/).

#### Amazon System Manager Agent

The current requirement for all AWS environments is to have the SSM agent installed and configured
on all Rackspace PDR monitored instances. This enables our select vendor agent deployment platform
as well as our security operations team to perform nessessary actions against your infrastructure. For more
information, see [Install AWS Systems Manager Agent (SSM Agent)](https://docs.aws.amazon.com/systems-manager/latest/userguide/ssm-agent.html).

#### Instance network requirements

The agents used to provide telementry to our Security Operations Center (SOC) do have specific
networking requirements that must be implemented. Use the
[Rackspace PDR Agent Network Requirements](/how-to/rackspace-pdr-agent-networking/) guide to correctly
implement network ACLs and firewall rules for your platform.

### Additional information

For more information on the Threat Manager offering, see the [Alert Logic upstream vendor documentation](https://docs.alertlogic.com/install/cloud/amazon-web-services-threat-manager-direct-windows.htm).
