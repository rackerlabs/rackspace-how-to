---
permalink: security-for-rackspace-private-cloud-powered-by-openstack/
audit_date:
title: Security for Rackspace Private Cloud powered by OpenStack
type: article
created_date: '2015-03-04'
created_by: Kenny Johnston
last_modified_date: '2016-01-14'
last_modified_by: Rose Coste
product: Rackspace Private Cloud Powered by OpenStack
product_url: rpc-openstack
---

Security is a very complex topic for every organization. Challenges can
include legislative requirements and internal procedures spanning across
both the physical, logical, and virtual layers. It is often because of
these challenges that customers are drawn to private clouds. Rackspace
Private Cloud powered by OpenStack is designed with the security posture
and flexibility to meet these varied needs.

The key to having a well-secured environment is not just identifying the
risks, but ensuring the appropriate controls are in place and that they
are being actively monitored. While our OpenStack private cloud provides
the flexibility, **Fanatical Support&reg;** brings best-practices and
expertise to achieve customer's control objectives.

This document will provide an introductory understanding of:

1.  Security configuration options available within our OpenStack
    private cloud
2.  Security of customer's OpenStack private cloud if hosted at
    Rackspace
3.  Security of customer's OpenStack private cloud if hosted within a
    customer's datacenter
4.  Security and *Fanatical Support* service
    -   For an OpenStack private cloud hosted at Rackspace
    -   For an OpenStack private cloud hosted with a customer's
        datacenter

### Assumptions

Users reading this should have a basic understanding of the following
concepts; if not some reference links are provided:

-   Familiarity with the components of [Rackspace Private Cloud powered
    by OpenStack](http://www.rackspace.com/cloud/private/) and Rackspace
    Public Cloud
-   Security Industry standards and regulations including: [ISO
    27001](https://en.wikipedia.org/wiki/ISO/IEC_27001),
    [SSAE16](http://www.aicpa.org/Research/Standards/AuditAttest/DownloadableDocuments/AT-00801.pdf),
    [FISMA](http://en.wikipedia.org/wiki/Federal_Information_Security_Management_Act_of_2002),
    [HIPAA](http://en.wikipedia.org/wiki/HIPPA)
-   [Difference between Software-, Platform-, and
    Infrastructure-as-a-service](http://csrc.nist.gov/publications/nistpubs/800-145/SP800-145.pdf)
-   The [OpenStack Security
    Guide](http://docs.openstack.org/security-guide/content/)

Please note that Rackspace provides various levels and types of Support
Services, not all information in this article will apply to all such
services. For more detail about which Support Services can meet your
needs, please contact a sales associate.

### Rackspace Private Cloud powered by OpenStack Security Configuration Options

OpenStack offers a variety of options on how to secure a private cloud.

#### Authentication and identity management

Within our OpenStack private cloud, identities can be authenticated
using either internal or external authentication protocols like: LDAP
and Active Directory. This allows enterprises to reuse their existing
identity management infrastructure.

#### Authorization and role management

Rackspace Private Cloud powered by OpenStack provides preconfigured
roles and role assignment. Roles provide fine-grained authorization over
specific actions and are assigned to identified users. Customers can
define custom roles to meet specific compliance or operational needs,
e.g. segregation of duties. These are defined within each of the cloud
components.

For example, a 'Cloud Operator' role might be configured to:

-   Add a new nova compute guest VM
-   Add additional storage to a zone
-   View an availability zone but not create one

#### Host operating systems

Rackspace Private Cloud powered by OpenStack recommends hardening the
host Operating Systems. Many current Private Cloud customers currently
do this and our Openstack private cloud team will collaborate with
customers to recommend a strategy based upon current corporate
standards.

#### Guest/VM operating systems

The OpenStack Image Service (based on the Glance project), as
implemented in our OpenStack private cloud, can be integrated into an
Enterprise's existing change management and image release process. This
allows the use of an organizations existing, hardened images. Please
consult with the OpenStack private cloud team for a list of the latest
supported base Operating Systems.

#### Multi-tenancy

Rackspace Private Cloud powered by OpenStack, is just that, a private
cloud OpenStack platform in a dedicated physical environment. A core
element of OpenStack is its support for multi-tenancy. Our OpenStack
private cloud leverages multi-tenancy by initially installing a
configuration that ensures isolation between tenants. Tenant isolation
can be used to prevent unrestricted communication between business units
or application domains. This best practice safeguards against cross-VLAN
communication by restricting ingress traffic based on destination port
and source IPs. If desired, configurations are also possible that could
allow inter-VLAN communication. Rackspace Private Cloud powered by
OpenStack Architects will work with customers to understand their needs
and recommend an appropriate solution.

Similarly, this practice also extends down into the storage platform by
leveraging the OpenStack Identity security service.

#### Communication

Rackspace Private Cloud powered by OpenStack separates management and
internal service traffic onto separate networks. Management networks are
secured via VPN access and hardware firewalls. OpenStack internal
communications are performed as RESTful API calls that can be secured
via the use of SSL/TLS certificates.

Looking forward, OpenStack's security groups are actively advancing
Firewall-as-a-Service and other OpenStack networking features enabling
multiple levels of software defined network isolation.

### Operational security

Rackspace's hosting policies and procedures set a high standard that
each employee, consultant, and third-party service provider is required
to follow. These corporate standards cover key functions like:

-   password based access
-   bastion server based access
-   VPN based access
-   password expiration
-   two factor authentication to bastion and VPN servers
-   access that are monitored and independently audited
-   automatic workstation locking
-   documented change management and escalation procedures
-   onboarding training

Rackspace maintains documented operational procedures for both
infrastructure operations and customer-facing support functions. Newly
provisioned infrastructure undergoes appropriate testing procedures to
limit exposure to any hardware failure. Documented procedures and
configuration version controls provide protection from errors during
configuration. Changes to an existing infrastructure are controlled by a
technical change management policy, which enforces best practice change
management controls including impact/risk assessment, customer sign off,
and back-out planning.

Rackspace participates in and maintains the following audit reports,
certifications, and documentation:

-   SSAE 16 / ISAE 3402 (formerly SAS70 Type II) Audit Reports
-   Safe Harbor Self-Certification
-   ISO 27001 Certification(s)
-   PCI Attestation of Compliance & PCI DSS Validated Service Provider
-   CDSA Certification
-   SOC2 Data Centers in Security & Availability Report
-   SOC3 Data Centers in Security & Availability Report

Whether the cloud is hosted at a Rackspace datacenter or at a customer's
datacenter, the support team will adhere to both Rackspace's corporate
as well as the customer's policies and procedures. The Rackspace team
will work with customers to determine the appropriate level of access
and proper delineation of responsibilities to support the Private Cloud
including identifying any logistical steps needed.

Division of key functions and responsibilities is based upon where the
OpenStack private cloud is deployed.

If Rackspace Private Cloud powered by OpenStack with Core Support is
hosted at Rackspace, this is how security responsibilities are divided
between Rackspace and the customer:

-   Rackspace has primary responsibility for:
    -     Hardware & data center
    -     Networking
    -     RPC host OS
    -     Backup (host OS)
    -     RPC Components
    -     Patching RPC
    -     RPC Upgrades
    -     Cloud Capacity Planning
-   Either the customer or Rackspace has primary responsibility for:
    -     Monitoring RPC
-   The customer has primary responsibilty for:
    -     Guest OS Imaging Creation and Patching
    -     Instance Deployment
    -     Application Management

If Rackspace Private Cloud powered by OpenStack with Core Support is
hosted at a customer or third-party data center, this is how security
responsibilities are divided between Rackspace and the customer:

-   Rackspace has primary responsibility for
    -     RPC Components
-   Either the customer or Rackspace has primary responsibility for
    -     RPC Host OS
    -     Backup (Host OS)
    -     Patching RPC
    -     Monitoring RPC
    -     RPC Upgrades
    -     Cloud Capacity Planning
-   The customer has primary responsibilty for
    -   Hardware & Data Center
    -   Networking
    -   Guest OS Imaging Creation and Patching
    -   Instance Deployment
    -   Application Management

If a Private Cloud is deployed at a customer's or third-party datacenter
and supported by Rackspace, the Rackspace Support team is willing to
work with customers to understand their specific security standards and
derive a solution that meets or exceeds those standards.

#### Data Security and backup

Our OpenStack private cloud allows 3rd party encryption tools to be used
throughout the infrastructure, including SSL/TLS certifications and
file/database encryption, giving customers flexibility to reuse their
current encryption tools. While no solution is prescribed, Rackspace
Implementation teams will work with customers to provide guidance on how
to integrate these.

Our OpenStack private cloud is integrated with Rackspace Managed Backup
service, giving customers the ability to securely back up Host Machine
information.

Operationally, the OpenStack private cloud Support Team can actively
monitor the cloud environment and proactively reach out to customers
when actions are required. Rackspace recommends and most customers wish
to provide an approval prior to any changes being made.

### Physical Security

For OpenStack private clouds hosted at a Rackspace Data Center, physical
security concerns are addressed across the data center and network.

#### Data Center

Rackspace Private Cloud powered by OpenStack is available in Rackspace
datacenters globally. Rackspace data centers physical security
capabilities include:

-   Two-factor authentication required to access all data
    center facilities.
-   Electromechanical locks controlled by biometric authentication (hand
    geometry or fingerprint scanner) and key-card/badge.
-   Access to secure sub-areas allocation on a role-specific basis
-   Authorized Rackspace personnel's access to the facilities is
    reviewed on a monthly basis by management
-   Termination and role-change control procedures are in place so that
    any physical or logical access rights are removed in a timely manner
    when access is no longer necessary or appropriate
-   Closed circuit video surveillance is installed at all entrance
    points on the interior and exterior of the buildings that house
    data centers. Cameras are monitored 24x7x365 by on-site security
    personnel and support data retention for 90 days.
-   Sensitive equipment such as information processing facilities,
    including customer servers, is housed in secure sub-areas within
    each data center's secure perimeter and is subject to additional
    controls
-   Centralized Security Management Systems are deployed at all data
    centers to control the Electronic Access Control Systems and closed
    circuit television networks.

Rackspace data centers are operational 24x7x365 and are manned
around-the-clock by a security team and engineering/operations
personnel. Appropriate additional perimeter defense measures, such as
walls, fencing, gates and anti-vehicle controls are in place at
Rackspace data centers. The delivery and loading bays at all Rackspace
data centers are separate areas secured by defined procedures and
security controls.

Unauthorized visitors are not permitted access to the data centers.
Authorized data center visitors are required to abide by the following
rules:

-   Authorized approvers must specifically grant visitor access to the
    data centers at least 24 hours before the scheduled visit
-   Visitors must have a valid reasons for entering the data center
-   Visitors must sign the visitor's log, present a valid photo ID, and
    specify the reason for visiting and a Rackspace point of contact
-   Visitor badges differ in appearance from Rackspace employee badges
    and do not provide any control over doors, locks, etc.
-   All visitor access is logged. This policy applies equally to
    Rackspace employees not assigned to the data center.
-   Visitors, including Rackspace customers, are strictly forbidden from
    accessing the data halls themselves and other secure sub areas.
-   Visitors must be escorted at all times while at any
    Rackspace Facility.
-   Data center management performs a monthly audit of security and
    visitor access logs

### Network Security

Whether deployed at Rackspace or within a customer's data center,
network security is as equally important as physical security and
encryption. OpenStack Neutron network component is a software defined
networks that provides enhanced flexibility on how to manage your
virtual network. Security over these networks can be applied in a
variety of ways. Rackspace Private Cloud Architects and Support team
will work with customers to help identify and develop an appropriate
solution to meet their current and future needs.

#### Network Security within a Rackspace Datacenter

All Rackspace network infrastructure devices are located in a physically
secure data center with controlled access. All visitors or authorized
contractors are logged and escorted. Local console access to network
devices is restricted to authorized individuals and requires access to
the physical location as well as the correct username and password for
console login. While Rackspace utilizes a wireless infrastructure for
corporate connectivity, wireless access points are not permitted in the
data halls where the cloud infrastructure resides and regular scans are
performed to identify and neutralize rogue access points.

Administrative access to the networking devices underlying the cloud
infrastructure is controlled via industry standard practices (TACACS+)
and is subject to appropriate logging and monitoring, records of which
are retained for one year. Logical access to cloud infrastructure
network devices is only provided to those Rackspace employees with a
business requirement for such access, and is subject to permissions
change control including independent managerial authorization and timely
revocation of access rights. SSL is used to encrypt administrative
sessions.

Implementing new cloud environments is performed according to
standardized procedures in order to minimize the risk of accidental
insecure network provisioning.

Rackspace maintains strict policies on the use of network services. The
network services underlying our cloud infrastructure are subject to
DDoS/DoS mitigation and network policy enforcement controls, ensuring
the best possible quality of connection to the customer's cloud
environment and maximizing the stability of the environment. These
include anti-spoofing controls and IP prefix-lists, as well as Unicast
Reverse Path Forwarding (URPF) protocols in place at edge routers in
data centers hosting cloud environments.

### Recommended Customer Controls

When hosted at Rackspace, Rackspace infrastructure controls are designed
to protect cloud resources from attack within the environment,
appropriately control and provide assurance over Rackspace access to
customer cloud resources. The customer should seek to protect their
cloud resources and hosted data with measures overlaying Rackspace
infrastructure controls as appropriate to their data's sensitivity and
criticality as informed by a formal risk assessment.

Customers are the primary owner of their data and maintain sole
visibility over its specific security requirements. Accordingly,
customers are responsible for classifying their data and applying
appropriate risk mitigation controls. Customer's sensitive data should
be encrypted for storage in order to preserve confidentiality. Rackspace
recommends that data being transmitted to and from the cloud should be
subject to encryption appropriate to its requirements, for example the
use of TLS or a secure VPN.

Our OpenStack private cloud customers can interact with the environment
at an administrative level via API. Authentication is required in order
to use them. Customer applications that interface with APIs should
undergo adequate security testing and maintain best practice application
security controls including communication with our SSL protected API
endpoints via HTTPS. Customers should consider tightly restricting
access to API keys and account credentials to those employees with a
legitimate business requirement, as well as segregating duties to
maintain accountability.

As primary system administrator of the cloud resources, the customer is
responsible for managing user accounts creation, provisioning and
destruction, password policies, server level account authentication
mechanisms, etc. Rackspace recommends that customers integrate their
Private Cloud with their organizational Single-sign on (SSO) domain if
available in order to simplify this task.

