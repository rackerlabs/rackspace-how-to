---
permalink: architecture-requirements-for-rackspace-private-cloud-powered-by-microsoft/
audit_date: '2016-10-14'
title: Architecture requirements for Rackspace Private Cloud powered by Microsoft
type: article
created_date: '2015-03-02'
created_by: Gerry Lecanu
last_modified_date: '2016-01-28'
last_modified_by: Constanze Kratel
product: Rackspace Private Cloud Powered By Microsoft Cloud Platform
product_url: rpc-microsoft
---

Rackspace Private Cloud Powered By Microsoft helps you realize your
data center goals by delivering enterprise-class capabilities, including
best-in-class management of your Microsoft Windows Server infrastructure
and first-party Microsoft workloads. It combines Microsoft software,
consolidated guidance, and best-practice architecture with Rackspace's
experience providing **_Fanatical Support&reg;_** and hosting solutions
for compute, network, and storage architectures.

Rackspace worked with Microsoft to design a cloud that complies
with product line architecture (PLA) to help you develop and implement
private cloud infrastructures quickly while reducing complexity and risk.

The Microsoft Private Cloud PLA uses the core capabilities of the
Microsoft Windows Server operating system, Hyper-V, and System Center to
deliver a private cloud infrastructure as a service offering.

The following are software features and components used for every
implementation Rackspace hosts.

### Cloud Platform Base Cloud

Base Cloud is a basic System Center 2012 R2 plus Windows Azure Pack that
allows for the minimum compliant Cloud Platform. It is composed of the
following applications and roles:

| Application or role                            | VM           | Quantity | Software suite     | vCPU | vRAM | vDisk  |
|------------------------------------------------|--------------|----------|--------------------|------|------|--------|
| Microsoft SQL Server Standard Edition          | DB           | 2        | System Center      | 2    | 8 GB | 60 GB  |
| Operations Manager                             | SCOM         | 2        | System Center      | 2    | 4 GB | 60 GB  |
| Service Provider Foundation                    | SPF          | 2        | System Center      | 2    | 4 GB | 60 GB  |
| Virtual Machine Manager                        | VMM          | 2        | System Center      | 2    | 8 GB | 60 GB  |
| Operations Manager Reporting Server            | OMRP         | 1        | System Center      | 2    | 4 GB | 60 GB  |
| Orchestrator                                   | OR           | 1        | System Center      | 2    | 4 GB | 60 GB  |
| Service Reporting                              | SR           | 1        | System Center      | 2    | 4 GB | 60 GB  |
| Service Manager                                | SM           | 1        | System Center      | 2    | 4 GB | 60 GB  |
| Library Server                                 | LIB          | 1        | System Center      | 2    | 8 GB | 1 TB   |
| Service Management Automation                  | SMA          | 1        | Windows Azure Pack | 2    | 8 GB | 60 GB  |
| Service Management Automation Reporting Worker | SMARW        | 1        | Windows Azure Pack | 2    | 4 GB | 60 GB  |
| Management Portal for Administrators           | WAPADMIN     | 1        | Windows Azure Pack | 2    | 4 GB | 60 GB  |
| Management Portal for Tenants                  | WAPTENANT    | 1        | Windows Azure Pack | 2    | 4 GB | 60 GB  |
| Admin Authentication Site                      | WAPADMINAUTH | 1        | Windows Azure Pack | 2    | 4 GB | 60 GB  |
| Admin API                                      | WAPADMINAPI  | 1        | Windows Azure Pack | 2    | 4 GB | 60 GB  |
| Tenant API                                     | WAPTENANTAPI | 1        | Windows Azure Pack | 2    | 4 GB | 60 GB  |
| Tenant Public API                              | WAPTENPUBAPI | 1        | Windows Azure Pack | 2    | 4 GB | 60 GB  |
| Tenant Authentication Site                     | WAPTENAUTH   | 1        | Windows Azure Pack | 2    | 4 GB | 60 GB  |
| Active Directory Domain Controller             | DC           | 1        | Windows Server     | 2    | 4 GB | 60 GB  |
| Remote Desktop Services                        | RD           | 1        | Windows Server     | 2    | 4 GB | 60 GB  |
| Windows Server Update Services                 | WSUS         | 1        | Windows Server     | 2    | 4 GB | 100 GB |
| Active Directory Certificate Authority         | PKI          | 1        | Windows Server     | 2    | 4 GB | 60 GB  |


The minimum system requirements to run the Base Cloud components are 52
vCPU, 128 GB of RAM, and 2.3 TB of storage. The Base Cloud workload is
split across two physical host servers that are configured in a failover
cluster.

### Additional Cloud Platform components

In addition to the Base Cloud offering, you can use three optional add-on
services to enhance your Microsoft Cloud Platform at Rackspace. You can
deploy one, two, or all three of these services on your Microsoft Cloud
Platform. If you add any optional services, the minimum required compute
and storage must account for the additional compute and storage loads.

#### Web Sites Cloud

Web Sites Cloud is a service that helps you provide a high-density,
scalable, shared web hosting platform for ASP.NET, PHP, and Node.js web
applications. The Web Sites Cloud service includes a customizable web
application gallery of open source web applications that integrate with
source control systems for custom-developed websites and applications.

With Microsoft SQL Server and MySQL Server, you can create the ideal
environment to leverage a database as a service (DBaaS) for your company,
which brings your company into the cloud era while maintaining private
cloud security. You can add one or more Microsoft SQL Servers or MySQL
Server instances for tenants to deploy and use. Tenants use these
databases with the Web Sites Cloud service.

| Application or role    | VM         | Quantity | Software suite     | vCPU | vRAM | vDisk  |
|------------------------|------------|----------|--------------------|------|------|--------|
| Management Server      | WAPWEBMN01 | 1        | Windows Azure Pack | 2    | 4 GB | 60 GB  |
| Controller             | WAPWEBCN   | 1        | Windows Azure Pack | 2    | 4 GB | 60 GB  |
| Database               | WAPWEBDB   | 1        | Windows Azure Pack | 2    | 4 GB | 300 GB |
| Publisher              | WAPWEBPUB  | 2        | Windows Azure Pack | 2    | 4 GB | 60 GB  |
| Fileserver             | WAPWEBFS   | 1        | Windows Azure Pack | 2    | 4 GB | 100 GB |
| Frontend               | WAPWEBFE   | 1        | Windows Azure Pack | 2    | 4 GB | 60 GB  |
| Shared Web Worker      | WAPWEBWWS  | 1        | Windows Azure Pack | 2    | 4 GB | 60 GB  |
| Reserved Worker Server | WAPWEBWR   | 1        | Windows Azure Pack | 2    | 4 GB | 60 GB  |
| SQL Server DBaaS       | SQLCLOUD   | 1        | Windows Azure Pack | 2    | 8 GB | 60 GB  |
| MySQL DBaaS            | MYSQL      | 1        | Windows Azure Pack | 2    | 8 GB | 60 GB  |
| App Controller         | AC         | 1        | Windows Azure Pack | 2    | 4 GB | 60 GB  |

The minimum system requirements to run the Web Sites Cloud components
are 24 vCPU, 56 GB of RAM, and 1 TB of storage. The Web Sites Cloud
workload adds to the Base Cloud system, which is split across
two physical host servers configured in a failover cluster.

#### Service Bus

The Service Bus service provides reliable messaging services between
distributed applications. The Service Bus service includes queued and
topic-based publish and subscribe capabilities.

| Application or role | VM name | Quantity | Software suite     | vCPU | vRAM | vDisk |
|---------------------|---------|----------|--------------------|------|------|-------|
| Service Bus         | SB      |     1    | Windows Azure Pack | 2    | 4 GB | 60 GB |

The minimum system requirements to run the Service Bus component are 2
vCPU, 4 GB of RAM, and 60 GB of storage. Service Bus workload adds to the
Base Cloud system, which is split across two physical host servers
configured in a failover cluster.

#### Active Directory Federation Services

Active Directory Federation Services (ADFS) provides simplified, secured
identity federation and web single sign-on (SSO) capabilities for end
users who want to access applications within an ADFS-secured enterprise,
in federation partner organizations, or in the cloud.

| Application or role                  | VM name | Quantity | Software suite     | vCPU | vRAM | vDisk |
|--------------------------------------|---------|----------|--------------------|------|------|-------|
| Active Directory Federation Services | ADFS    | 2        | Windows Azure Pack | 2    | 4 GB | 60 GB |

The minimum system requirements to run the ADFS component are 4 vCPU, 8
GB of RAM, and 120 GB of storage.  The ADFS workload adds to the
Base Cloud system, which is split across two physical host servers
configured in a failover cluster.
