---
permalink: security-for-rackspace-private-cloud-powered-by-openstack/
audit_date:
title: Security for Rackspace Private Cloud powered by OpenStack
type: article
created_date: '2015-03-04'
created_by: Kenny Johnston
last_modified_date: '2016-12-05'
last_modified_by: Laura Santamaria
product: Rackspace Private Cloud Powered by OpenStack
product_url: rpc-openstack
---

Security is a very complex topic for every organization. Challenges can include
legislative requirements and internal procedures spanning across both the
physical, logical, and virtual layers. It is often because of these challenges
that customers are drawn to private clouds. Rackspace Private Cloud powered by
OpenStack (RPCO) is designed with the security posture and flexibility to meet
these varied needs.

The key to having a well-secured environment is not just identifying the risks,
but ensuring the appropriate controls are in place and that they are being
actively monitored. While RPCO provides the flexibility, **Fanatical
Support<sup>&reg;</sup>** brings best practices and expertise to achieve your
control objectives.

This document provides an introductory understanding of the following concepts:

1. Security configuration options available within RPCO
2. Security of your RPCO if hosted at Rackspace
3. Security of your RPCO if hosted within your data center
4. Security and *Fanatical Support* service for RPCO hosted either at Rackspace
  or at your data center

### Assumptions

Users reading this should have a basic understanding of the following concepts;
if not, see the following references:

- Familiarity with the components of
[Rackspace Private Cloud powered by OpenStack](http://www.rackspace.com/cloud/private/)
and Rackspace Public Cloud
- Security industry standards and regulations, including:
    - [ISO 27001](https://en.wikipedia.org/wiki/ISO/IEC_27001)
    - [SSAE16](http://www.aicpa.org/Research/Standards/AuditAttest/DownloadableDocuments/AT-00801.pdf)
    - [FISMA](http://en.wikipedia.org/wiki/Federal_Information_Security_Management_Act_of_2002)
    - [HIPAA](http://en.wikipedia.org/wiki/HIPPA)
- [Difference between Software-, Platform-, and Infrastructure-as-a-service](http://csrc.nist.gov/publications/nistpubs/800-145/SP800-145.pdf)
- The [OpenStack Security Guide](http://docs.openstack.org/security-guide/content/)

Please note that while Rackspace provides various levels and types of support
services, not all information in this article will apply to all such services.
For more detail about which support services can meet your needs, please contact
a sales associate.

### Rackspace Private Cloud powered by OpenStack security configuration options

OpenStack offers a variety of options on how to secure a private cloud.

#### Authentication and identity management

Within RPCO, identities can be authenticated using either internal or external
authentication protocols like LDAP and Active Directory. This option allows
enterprises to reuse their existing identity management infrastructure.

#### Authorization and role management

RPCO provides preconfigured roles and role assignment. Roles provide
fine-grained authorization over specific actions and are assigned to identified
users. You can define custom roles to meet your specific compliance or
operational needs, such as segregation of duties. These roles are defined within
each of the cloud components.

For example, a 'Cloud Operator' role might be configured to be able to complete
the following actions:

- Add a new OpenStack Compute (nova) guest virtual machine (VM)
- Add additional storage to a zone
- View an availability zone but not create one

#### Host operating systems

Starting with version 12.2, RPCO has an optional security hardening role that
provides an automated, approved process for meeting the hardening needs of
private clouds. The controls are based on the Security Technical Implementation
Guide (STIG) from the United States government, and our OpenStack engineers have
reviewed the controls to ensure compatibility or to document incompatibility
with OpenStack clouds. For more technical details, see
[Rackspace Private Cloud Security Hardening (PDF)](https://dab35129f0361dca3159-2fe04d8054667ffada6c4002813eccf0.ssl.cf1.rackcdn.com/downloads/pdfs/private-cloud-security-hardening-in-rpc-white-paper.pdf)
and the
[developer documentation on security hardening in RPCO](https://developer.rackspace.com/docs/private-cloud/rpc/v12/rpc-releasenotes/whats-new-v12-2/#security-hardening).

RPCO recommends hardening the host operating systems. Many current RPCO
customers currently do this, and our Openstack Private Cloud team will
collaborate with you to recommend a strategy based upon your current corporate
standards.

#### Guest/VM operating systems

The OpenStack Image Service (glance), as implemented in RPCO, can be integrated
into your existing change management and image release process. This option
allows the use of your existing, hardened images. Please consult with the
OpenStack Private Cloud team for a list of the latest supported base operating
systems.

#### Multi-tenancy

RPCO is just that, a private cloud OpenStack platform in a dedicated physical
environment. A core element of OpenStack is its support for multi-tenancy. RPCO
leverages multi-tenancy by initially installing a configuration that ensures
isolation between tenants. Tenant isolation can be used to prevent unrestricted
communication between business units or application domains. This best practice
safeguards against cross-VLAN communication by restricting ingress traffic based
on destination port and source IPs. If desired, configurations are also possible
that could allow inter-VLAN communication. RPCO architects will work with you to
understand your needs and to recommend an appropriate solution.

Similarly, this practice also extends down into the storage platform by
leveraging the OpenStack Identity security service (keystone).

#### Communication

RPCO separates management and internal service traffic onto separate networks.
Management networks are secured via VPN access and hardware firewalls. OpenStack
internal communications are performed as RESTful API calls that can be secured
via the use of SSL/TLS certificates.

Looking forward, OpenStack's security groups are actively advancing
Firewall-as-a-Service and other OpenStack networking features enabling multiple
levels of software-defined network isolation.

### Operational security

Rackspace's hosting policies and procedures set a high standard that each
employee, consultant, and third-party service provider is required to follow.
These corporate standards cover key functions like the following functions:

- password based access
- bastion server based access
- VPN based access
- password expiration
- two-factor authentication to bastion and VPN servers
- access that is monitored and independently audited
- automatic workstation locking
- documented change management and escalation procedures
- onboarding training

Rackspace maintains documented operational procedures for both infrastructure
operations and customer-facing support functions. Newly provisioned
infrastructure undergoes appropriate testing procedures to limit exposure to any
hardware failure. Documented procedures and configuration version controls
provide protection from errors during configuration. Changes to an existing
infrastructure are controlled by a technical change management policy, which
enforces best-practice change management controls, including impact or risk
assessment, customer sign-off, and back-out planning.

Rackspace participates in and maintains the following audit reports,
certifications, and documentation:

- SSAE 16 / ISAE 3402 (formerly SAS70 Type II) Audit Reports
- Safe Harbor Self-Certification
- ISO 27001 Certification(s)
- PCI Attestation of Compliance & PCI DSS Validated Service Provider
- CDSA Certification
- SOC2 Data Centers in Security & Availability Report
- SOC3 Data Centers in Security & Availability Report

Whether the cloud is hosted at a Rackspace data center or at your data center,
the support team adheres to both Rackspace's corporate policies and procedures
as well as your policies and procedures. The Rackspace team works with you to
determine the appropriate level of access and proper delineation of
responsibilities to support the private cloud, including identifying any
logistical steps needed.

Division of key functions and responsibilities is based upon where the RPCO is
deployed.

If the RPCO with Core Support is hosted at Rackspace, the following list
explains how security responsibilities are divided between Rackspace and you:

- Rackspace has the primary responsibility for
    - Hardware and the data center
    - Networking
    - RPCO host OS
    - Backup (host OS)
    - RPCO Components
    - Patching RPCO
    - RPCO Upgrades
    - Cloud capacity planning
- Either you or Rackspace has the primary responsibility for
    - Monitoring RPCO
- You have the primary responsibility for
    - Guest OS imaging creation and patching
    - Instance deployment
    - Application management

If the RPCO with Core Support is hosted at your or a third-party data center,
the following list explains how security responsibilities are divided between
Rackspace and you:

- Rackspace has the primary responsibility for
    - RPCO Components
- Either you or Rackspace has the primary responsibility for
    - RPCO host OS
    - Backup (host OS)
    - Patching RPCO
    - Monitoring RPCO
    - RPCO upgrades
    - Cloud capacity planning
- You have the primary responsibility for
    - Hardware and the data center
    - Networking
    - Guest OS imaging creation and patching
    - Instance deployment
    - Application management

If RPCO is deployed at your or a third-party's data center and is supported by
Rackspace, the Rackspace Support team is willing to work with you to understand
your specific security standards and to derive a solution that meets or exceeds
those standards.

#### Data security and backup

RPCO allows third-party encryption tools to be used throughout the
infrastructure, including SSL/TLS certifications and file or database
encryption, giving you the flexibility to reuse your current encryption tools.
While no solution is prescribed, Rackspace Implementation teams can work with
you to provide guidance on how to integrate these tools.

RPCO is integrated with Rackspace Managed Backup service, giving you the ability
to securely back up your host machine information.

Operationally, the RPCO Support Team can actively monitor the cloud environment
and proactively reach out to you when actions are required. Rackspace recommends
and most customers wish to provide an approval prior to any changes being made.

### Physical security

For RPCO hosted at a Rackspace data center, physical security concerns are
addressed across the data center and network.

#### Data center

RPCO is available in Rackspace data centers globally. Rackspace data centers
physical security capabilities include the following features:

- Two-factor authentication required to access all data center facilities.
- Electromechanical locks controlled by biometric authentication (hand geometry
  or fingerprint scanner) and keycards or badges.
- Access to secure sub-areas allocation decided on a role-specific basis.
- Authorized Rackspace personnel's access to the facilities is reviewed on a
  monthly basis by management.
- Termination and role-change control procedures are in place so that any
  physical or logical access rights are removed in a timely manner when access
  is no longer necessary or appropriate.
- Closed circuit video surveillance is installed at all entrance points on the
  interior and exterior of the buildings that house data centers. Cameras are
  monitored 24x7x365 by on-site security personnel and support data retention
  for 90 days.
- Sensitive equipment such as information processing facilities, including
  customer servers, is housed in secure sub-areas within each data center's
  secure perimeter and is subject to additional controls.
- Centralized Security Management Systems are deployed at all data centers to
  control the Electronic Access Control Systems and closed circuit television
  networks.

Rackspace data centers are operational 24x7x365 and are manned around-the-clock
by a security team and engineering and operations personnel. Appropriate
additional perimeter defense measures, such as walls, fencing, gates and
anti-vehicle controls are in place at Rackspace data centers. The delivery and
loading bays at all Rackspace data centers are separate areas secured by defined
procedures and security controls.

Unauthorized visitors are not permitted access to the data centers. Authorized
data center visitors are required to abide by the following rules:

- Authorized approvers must specifically grant visitor access to the data
  centers at least 24 hours before the scheduled visit.
- Visitors must have a valid reasons for entering the data center.
- Visitors must sign the visitor's log, present a valid photo ID, and specify
  the reason for visiting and a Rackspace point of contact.
- Visitor badges differ in appearance from Rackspace employee badges and do not
  provide any control over doors, locks, and so on.
- All visitor access is logged. This policy applies equally to Rackspace
  employees not assigned to the data center.
- Visitors, including Rackspace customers, are strictly forbidden from accessing
  the data halls themselves and other secure sub-areas.
- Visitors must be escorted at all times while at any Rackspace facility.
- Data center management performs a monthly audit of security and visitor access
  logs.

### Network security

Whether deployed at Rackspace or within your data center, network security is as
equally important as physical security and encryption. OpenStack Neutron network
component is a software-defined network that provides enhanced flexibility on
how to manage your virtual network. Security over these networks can be applied
in a variety of ways. RPCO architects and the support team can work with you to
help identify and develop an appropriate solution to meet your current and
future needs.

#### Network security within a Rackspace data center

All Rackspace network infrastructure devices are located in a physically secure
data center with controlled access. All visitors or authorized contractors are
logged and escorted. Local console access to network devices is restricted to
authorized individuals and requires access to the physical location as well as
the correct username and password for console login. While Rackspace utilizes a
wireless infrastructure for corporate connectivity, wireless access points are
not permitted in the data halls where the cloud infrastructure resides, and
regular scans are performed to identify and neutralize rogue access points.

Administrative access to the networking devices underlying the cloud
infrastructure is controlled via industry standard practices (TACACS+) and is
subject to appropriate logging and monitoring, the records of which are retained
for one year. Logical access to cloud infrastructure network devices is only
provided to those Rackspace employees with a business requirement for such
access and is subject to permissions change control, including independent
managerial authorization and timely revocation of access rights. SSL is used to
encrypt administrative sessions.

Implementing new cloud environments is performed according to standardized
procedures to minimize the risk of accidental insecure network provisioning.

Rackspace maintains strict policies on the use of network services. The network
services underlying our cloud infrastructure are subject to DDoS/DoS mitigation
and network policy enforcement controls, ensuring the best possible quality of
connection to your cloud environment and maximizing the stability of the
environment. These controls include anti-spoofing controls and IP prefix-lists,
as well as Unicast Reverse Path Forwarding (URPF) protocols in place at edge
routers in data centers hosting cloud environments.

### Recommended customer controls

When hosted at Rackspace, Rackspace infrastructure controls are designed to
protect cloud resources from attack within the environment and to appropriately
control and provide assurance over Rackspace access to your cloud resources. You
should seek to protect your cloud resources and hosted data with measures
overlaying Rackspace infrastructure controls as appropriate to your data's
sensitivity and criticality as informed by a formal risk assessment.

You are the primary owner of your data and maintain sole visibility over its
specific security requirements. Accordingly, you are responsible for classifying
your data and applying appropriate risk mitigation controls. Your sensitive data
should be encrypted for storage to preserve confidentiality. Rackspace
recommends that data being transmitted to and from the cloud should be subject
to encryption appropriate to its requirements, like the use of TLS or a secure
VPN.

You can interact with the environment at an administrative level via APIs.
Authentication is required in order to use them. Customer applications that
interface with APIs should undergo adequate security testing and maintain
best-practice application security controls, including communication with our
SSL-protected API endpoints via HTTPS. You should consider tightly restricting
access to API keys and account credentials to those employees with a legitimate
business requirement, as well as segregating duties to maintain accountability.

As primary system administrator of the cloud resources, you are responsible for
managing user accounts creation, provisioning and destruction, password
policies, server-level account authentication mechanisms, and so on. Rackspace
recommends that you integrate your private cloud with your organizational
single-sign on (SSO) domain if available to simplify this task.
