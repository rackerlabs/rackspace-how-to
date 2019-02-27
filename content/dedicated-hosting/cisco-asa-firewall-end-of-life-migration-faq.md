---
permalink: cisco-asa-firewall-end-of-life-migration-faq/
audit_date: '2019-01-25'
title: Cisco ASA firewall end-of-life migration FAQ
type: article
created_date: '2019-01-25'
created_by: Shannon Enix
last_modified_date: '2019-01-28'
last_modified_by: William Loy
product: Dedicated Hosting
product_url: dedicated-hosting
---

The Cisco&reg; Adaptive Security Appliance (ASA) 5505, 5510, 5520, 5540, and 5550 firewalls are reaching Rackspace end of life (EOL) on September 1, 2019. In anticipation of the end-of-life for Cisco ASA&reg; firewall, Rackspace has started customer migrations. This article provides answers to frequently asked questions about Rackspace’s Cisco ASA Firewall end-of-life migrations.

#### What does the Rackspace end of life of Cisco ASA Firewalls mean?

This means that beginning on the end-of-life date, hardware Service Level Agreements (SLA) and support services will no longer apply, and the platforms will be subject to the Extended Lifecycle Support terms found here: [Legal end-of-life terms](https://www.rackspace.com/information/legal/eolterms).


#### Why do I need to migrate to a new firewall?

To ensure you continue to receive Rackspace hosting services and technical support, you need to migrate to a supported firewall. Rackspace wants to assist you in making this transition immediately to help you avoid the following security and compliance risks:

- end-of-life networking hardware

- unpatched security vulnerabilities

- unsupported code versions

End-of-life products or services pose a higher security risk for you and for Rackspace. If a security vulnerability is discovered, Rackspace reserves the right to mitigate this risk accordingly, which might include suspension of your affected products or services, pending upgrade to supported products or services.

#### What are the available firewall migration choices?

We recommend customers with the Cisco ASA 5505, 5510 and 5520 migrate to the Cisco ASA 5508-X. We recommend customers with the Cisco ASA 5540 or 5550 migrate to the Cisco Firepower&reg; 2110. In addition to the above listed devices, other firewall options exist, including Juniper Networks&reg; or Palo Alto Networks&reg; firewalls.

#### What are the benefits of migrating to the Cisco ASA 5508-X firewall?

By migrating from a Cisco ASA 5505, 5510, 5520 to the Cisco ASA 5508-X customers gain up to six times stateful inspection throughput, Solid State drives (SSD) for faster processing, and access to enable Cisco Firepower Services for next-generation firewall features:

- Application visibility and control (AVC). More than 4,000 application-layer and risk-based controls to set intrusion prevention system (IPS) threat-detection policies on how to handle the traffic entering, exiting, and traversing your network by security zone, geographical location, port, application, requested URL, Identity Services Engine&reg;(ISE) attribute, and user.

- Reputation and category-based URL filtering (URL). Comprehensive alerting and control over suspect web traffic, and policy enforcement on hundreds of millions of URLs.

- Threat Defense Intrusion Prevention System (IPS) features threat prevention capabilities and contextual awareness of users, infrastructure, applications, as well as content to help you detect multi-vector threats and automate the defense response.

#### What are the benefits of migrating to the Cisco Firepower&reg; 2110 firewall?

By migrating from a Cisco ASA 5540, 5550 to a Cisco Firepower 2110 firewall customers gain up to four times stateful inspection throughput, Solid State Drives (SSD) for faster processing, and access to enable Cisco Firepower services to the following next-generation firewall features:

- Application visibility and control (AVC). More than 4,000 application-layer and risk-based controls to set IPS threat-detection policies on how to handle the traffic entering, exiting, and traversing your network by security zone, geographical location, port, application, requested URL, ISE attribute and user.

- Reputation and category-based URL filtering (URL). Comprehensive alerting and control over suspect web traffic, and policy enforcement on hundreds of millions of URLs.

- Threat Defense Intrusion Prevention System (IPS) features threat prevention capabilities and contextual awareness of users, infrastructure, applications, as well as content to help you detect multi-vector threats and automate the defense response.

- Advanced Malware Protection (AMP). Discover, track, contain, and block the progression of network-based advanced malware, zero-day attacks, and persistent threats.

#### What does the migration process entail?

As part of the migration, Rackspace support teams perform a fresh install of the updated firewall code version on a supported firewall platform. A backup of your configuration is made prior to the migration. The backed up configuration is kept and used to restore your networking configurations on the new firewall.

#### Will I need to upgrade to a new code version?

We recommend migrating to a Rackspace supported and approved firewall. This migration might entail upgrading to an updated firewall code version to continue receiving Rackspace hosting services and technical support.

#### Will the migration change my IP address?

In some cases, this migration might require a change in the public Internet Protocol (IP) address of your edge firewalls, which you will be notified of by Rackspace in advance. The need for an IP change depends on the individual device data center location and switchport availability. An attempt to locate a viable location within the same public zone will be made but cannot be guaranteed.

#### What if my contract term extends past the September 1, 2019 EOL date?

If the current term of your agreement for the services described above extends beyond the end-of-life date, Rackspace will continue providing the services in accordance with your agreement until the expiration of your current contract term. The Extended Lifecycle Support terms will be effective for your Hosted System upon renewal to include auto-renewal.

#### Is there a fee to migrate to a new firewall?

While there is no fee to opt-in to a planned maintenance window for Cisco ASA migrations, the new platform will have its own pricing, which might result in a price change. Contact your Account Manager or Service Delivery Manager for more information.

#### Is the Cisco ASA-X 5508 compatible with RackConnect v2?

Yes, the Cisco ASA 5508-X is compatible with RackConnect v2.
