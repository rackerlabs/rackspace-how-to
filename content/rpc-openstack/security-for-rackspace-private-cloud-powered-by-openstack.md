---
permalink: security-for-rackspace-private-cloud-powered-by-openstack/
audit_date: '2016-12-12'
title: Security for Rackspace Private Cloud Powered By OpenStack
type: article
created_date: '2015-03-04'
created_by: Kenny Johnston
last_modified_date: '2016-12-12'
last_modified_by: Laura Santamaria
product: Rackspace Private Cloud Powered by OpenStack
product_url: rpc-openstack
---

Security is a complex topic for every organization. Challenges can include
legislative requirements and internal procedures that span the physical,
logical, and virtual layers. These challenges are often what draws customers to
private clouds. Rackspace Private Cloud Powered By OpenStack (RPCO) is designed
with the security posture and flexibility to meet these challenges.

The key to having a well-secured environment is not just identifying the risks
but ensuring that appropriate controls are in place and are being actively
monitored. While RPCO provides the flexibility, ***Fanatical Support<sup>&reg;</sup>***
brings best practices and expertise to achieve your control objectives.

This document provides an introductory understanding of the following concepts:

1. Security configuration options available within RPCO
2. Security of your private cloud if hosted at Rackspace
3. Security of your private cloud if hosted within your data center
4. Security and ***Fanatical Support*** service for your private cloud hosted
    either at Rackspace or at your data center

### Assumptions

You should have a basic understanding of the following concepts; if not, see the
linked references:

- The components of [Rackspace Private Cloud Powered By OpenStack](http://www.rackspace.com/cloud/private/)
    and Rackspace Public Cloud
- Security industry standards and regulations, including:
    - [ISO/IEC 27001](https://en.wikipedia.org/wiki/ISO/IEC_27001)
    - [SSAE 16](http://www.aicpa.org/Research/Standards/AuditAttest/DownloadableDocuments/AT-00801.pdf)
    - [FISMA](http://en.wikipedia.org/wiki/Federal_Information_Security_Management_Act_of_2002)
    - [HIPAA](http://en.wikipedia.org/wiki/HIPPA)
- [Differences among software as a service (SaaS), platform as a service (PaaS), and infrastructure as a service (IaaS)](http://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-145.pdf)
- [OpenStack security information](http://docs.openstack.org/security-guide/content/)

Although Rackspace provides various levels and types of support services, not
all of the information in this article applies to all such services. For more
information about which support services meet your needs, contact a sales
associate.

### Security configuration options

OpenStack offers a variety of options for securing a private cloud.

#### Authentication and identity management

Within RPCO, identities can be authenticated by using either internal or
external authentication protocols like LDAP and Active Directory. This option
allows enterprises to reuse their existing identity management infrastructure.

#### Authorization and role management

RPCO provides preconfigured roles and role assignment. Roles provide
fine-grained authorization over specific actions and are assigned to identified
users. You can define custom roles to meet your specific compliance or
operational needs, such as segregation of duties. These roles are defined within
each of the cloud components.

For example, a Cloud Operator role might be configured to perform the following
actions:

- Add a new OpenStack Compute (nova) guest virtual machine (VM)
- Add additional storage to a zone
- View an availability zone, but not create one

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

RPCO recommends hardening the host operating systems. Many RPCO customers
currently do this, and our RPCO team collaborates with you to recommend a
strategy based on your current corporate standards.

#### Guest and VM operating systems

The OpenStack Image service (glance), as implemented in RPCO, can be integrated
into your existing change management and image release process. This option
allows you to use your existing, hardened images. Consult with the RPCO team for
a list of the latest supported base operating systems.

#### Multi-tenant environment

OpenStack saves costs by allowing users to provision resources at any time and
those resources will be placed on systems that contain resources for other
users. In a typical company, this may mean that different applications from
different departments are running on the same physical server.

The Rackspace OpenStack Private Cloud platform uses several technologies to
prevent a user from accessing another user's resources or to contain a breach.

[Mandatory Access Control (MAC)](https://en.wikipedia.org/wiki/Mandatory_access_control)
policies enforced by [AppArmor](https://en.wikipedia.org/wiki/AppArmor)
provide strong protection between virtual machines. In the event of a breach in
a single virtual machine, AppArmor policies limit the attacker from moving to
other virtual machines or onto the hypervisor itself. For more details, review
the
[Hardening the virtualization layers](https://docs.openstack.org/security-guide/compute/hardening-the-virtualization-layers.html)
section of the OpenStack Security Guide.

Proper network segmentation limits the extent of a breach and prevents
intercommunication between different systems. Rackspace recommends placing
virtual machines from different users or projects on separate VLANs to prevent
unauthorized communication. Software defined networks, such as VXLAN networks,
can subdivide traffic further and allow users to configure their own segmented
networks. Rackspace architects can create a network solution for your private
cloud that meets your security and flexibility requirements.

#### Communication

RPCO separates management and internal service traffic onto separate networks.
Management networks are secured by VPN access and hardware firewalls. OpenStack
internal communications are performed as RESTful API calls that can be secured
by the use of SSL/TLS certificates.

Looking forward, OpenStack's security groups are actively advancing firewall as
a service (FWaaS) and other OpenStack networking features that enable multiple
levels of software-defined network isolation.

### Operational security

Rackspace's hosting policies and procedures set a high standard that each
employee, consultant, and third-party service provider is required to follow.
These corporate standards cover key functions like the following ones:

- Password-based access
- Bastion-server-based access
- VPN-based access
- Password expiration
- Two-factor authentication to bastion and VPN servers
- Access that is monitored and independently audited
- Automatic workstation locking
- Documented change management and escalation procedures
- Onboarding training

Rackspace maintains documented operational procedures for infrastructure
operations and customer-facing support functions. Newly provisioned
infrastructure undergoes appropriate testing procedures to limit exposure to any
hardware failure. Documented procedures and configuration version controls
provide protection from errors during configuration. Changes to an existing
infrastructure are controlled by a technical change management policy, which
enforces best-practice change management controls, including impact or risk
assessment, customer sign-off, and back-out planning.

#### Third-party reports, certifications, and documentation

Rackspace participates in and maintains the following audit reports,
certifications, and documentation:

- SSAE 16 / ISAE 3402 (formerly SAS 70 Type II) audit reports
- Safe Harbor self-certification
- ISO/IEC 27001 certifications
- PCI Attestation of Compliance and PCI DSS Validated Service Provider
- CDSA certification
- SOC 2 Data Centers in Security & Availability Report
- SOC 3 Data Centers in Security & Availability Report

#### Security responsibilities

Whether the private cloud is hosted at a Rackspace data center or at your data
center, the support team adheres to both Rackspace's corporate policies and
procedures and your policies and procedures. The Rackspace team works with you
to determine the appropriate level of access and proper delineation of
responsibilities to support the private cloud, including identifying any
necessary logistical steps.

Division of key functions and responsibilities is based upon where the private
cloud is deployed.

If the cloud with Core Support is hosted at Rackspace, the following list
explains how security responsibilities are divided between Rackspace and you:

- Rackspace has the primary responsibility for:
    - Hardware and the data center
    - Networking
    - RPCO host OS
    - Backup (host OS)
    - RPCO components
    - Patching RPCO
    - RPCO upgrades
    - Cloud capacity planning
- Either you or Rackspace has the primary responsibility for:
    - Monitoring RPCO
- You have the primary responsibility for:
    - Guest OS imaging creation and patching
    - Instance deployment
    - Application management

If the cloud with Core Support is hosted at your or a third-party data center,
the following list explains how security responsibilities are divided between
Rackspace and you:

- Rackspace has the primary responsibility for:
    - RPCO components
- Either you or Rackspace has the primary responsibility for:
    - RPCO host OS
    - Backup (host OS)
    - Patching RPCO
    - Monitoring RPCO
    - RPCO upgrades
    - Cloud capacity planning
- You have the primary responsibility for:
    - Hardware and the data center
    - Networking
    - Guest OS imaging creation and patching
    - Instance deployment
    - Application management

If RPCO is deployed at your or a third-party's data center and is supported by
Rackspace, the Rackspace Support team can work with you to understand your
specific security standards and to derive a solution that meets or exceeds those
standards.

#### Data security and backup

RPCO allows third-party encryption tools to be used throughout the
infrastructure, including SSL/TLS certifications and file or database
encryption, giving you the flexibility to reuse your current encryption tools.
Although no solution is prescribed, Rackspace implementation teams can provide
guidance on how to integrate these tools.

RPCO is integrated with the Rackspace Managed Backup service, giving you the
ability to securely back up your host machine information.

Operationally, the RPCO Support team can actively monitor the cloud environment
and proactively reach out to you when actions are required. Rackspace recommends
and most customers want to provide an approval prior to any changes being made.

### Physical security

For RPCO hosted at a Rackspace data center, physical security concerns are
addressed across the data center.

RPCO is available in Rackspace data centers globally. The physical security
capabilities of the data centers include the following features:

- Two-factor authentication is required to access all data center facilities.
- Electromechanical locks are controlled by biometric authentication (hand
  geometry or fingerprint scanner) and keycards or badges.
- Access to secure sub-areas allocation is decided on a role-specific basis.
- Authorized Rackspace personnel's access to the facilities is reviewed on a
  monthly basis by management.
- Termination and role-change control procedures are in place so that any
  physical or logical access rights are removed in a timely manner when access
  is no longer necessary or appropriate.
- Closed-circuit video surveillance is installed at all entrance points on the
  interior and exterior of the buildings that house data centers. Cameras are
  monitored 24x7x365 by on-site security personnel and support data retention
  for 90 days.
- Sensitive equipment such as information processing facilities, including
  customer servers, is housed in secure sub-areas within each data center's
  secure perimeter and is subject to additional controls.
- Centralized security management systems are deployed at all data centers to
  control the electronic access control systems and closed-circuit television
  networks.

Rackspace data centers are operational 24x7x365 and are staffed continuously by
a security team and engineering and operations personnel. Appropriate additional
perimeter defense measures, such as walls, fencing, gates and antivehicle
controls, are in place at Rackspace data centers. The delivery and loading bays
at all Rackspace data centers are separate areas secured by defined procedures
and security controls.

Unauthorized visitors are not permitted access to the data centers. Authorized
data center visitors are required to abide by the following rules:

- Authorized approvers must specifically grant visitor access to the data
  centers at least 24 hours before the scheduled visit.
- Visitors must have a valid reason for entering the data center.
- Visitors must sign the visitor's log, present a valid photo ID, and specify
  the reason for visiting and a Rackspace point of contact.
- Visitor badges differ in appearance from Rackspace employee badges and do not
  provide any control over doors, locks, and so on.
- All visitor access is logged. This policy also applies to Rackspace employees
  not assigned to the data center.
- Visitors, including Rackspace customers, are strictly forbidden from accessing
  the data halls and other secure sub-areas.
- Visitors must be escorted at all times while at any Rackspace facility.
- Data center management performs a monthly audit of security and visitor access
  logs.

### Network security

Whether your cloud is deployed at Rackspace or within your data center, network
security is as important as physical security and encryption. The OpenStack
Networking (neutron) network component is a software-defined network that
provides enhanced flexibility on how to manage your virtual network. Security
over these networks can be applied in a variety of ways. RPCO architects and the
support team can help you identify and develop an appropriate solution to meet
your current and future needs.

#### Network security within a Rackspace data center

All Rackspace network infrastructure devices are located in a physically secure
data center with controlled access. All visitors or authorized contractors are
logged and escorted. Local console access to network devices is restricted to
authorized individuals and requires access to the physical location as well as
the correct username and password for console login. Although Rackspace uses a
wireless infrastructure for corporate connectivity, wireless access points are
not permitted in the data halls where the cloud infrastructure resides, and
regular scans are performed to identify and neutralize rogue access points.

Administrative access to the networking devices underlying the cloud
infrastructure is controlled through industry standard practices (TACACS+) and
is subject to appropriate logging and monitoring, the records of which are
retained for one year. Logical access to cloud infrastructure network devices is
provided only to those Rackspace employees with a business requirement for such
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

When hosted at Rackspace, Rackspace infrastructure controls protect cloud
resources from attack within the environment and appropriately control and
provide assurance over Rackspace access to your cloud resources. You should
protect your cloud resources and hosted data with measures that overlay
Rackspace infrastructure controls, as appropriate to your data's sensitivity and
criticality as informed by a formal risk assessment.

You are the primary owner of your data and maintain sole visibility over its
specific security requirements. Accordingly, you are responsible for classifying
your data and applying appropriate risk mitigation controls. Your sensitive data
should be encrypted for storage to preserve confidentiality. Rackspace
recommends that data being transmitted to and from the cloud should be subject
to encryption appropriate to its requirements, like the use of TLS or a secure
VPN.

You can interact with the environment at an administrative level through APIs.
Authentication is required to use the APIs. Customer applications that interact
with APIs should undergo adequate security testing and maintain best-practice
application security controls, including communication with our SSL-protected
API endpoints via HTTPS. Consider tightly restricting access to API keys and
account credentials to those employees with a legitimate business requirement,
as well as segregating duties to maintain accountability.

As the primary system administrator of your cloud resources, you are responsible
for managing the creation, provisioning, and destruction of user accounts;
password policies; server-level account authentication mechanisms; and so on.
Rackspace recommends that you integrate your private cloud with your
organizational single-sign on (SSO) domain, if available, to simplify this task.
