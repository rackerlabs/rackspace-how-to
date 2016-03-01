---
node_id: 4574
title: Architecture requirements for Rackspace Private Cloud powered by Microsoft
type: article
created_date: '2015-03-02'
created_by: Gerry Lecanu
last_modified_date: '2016-01-28'
last_modified_by: Constanze Kratel
product: Rackspace Private Cloud Powered by Microsoft Cloud Platform
product_url: rpc-microsoft
---

To compete in the global economy and keep up with the pace of
innovation, organizations must improve their ability to quickly and
flexibly respond to changing business needs, improve efficiency, and
better manage costs.  Some ways to accomplish this include automation of
repeatable tasks, cross-platform interoperability, and the creation and
deployment of modern, self-service, and highly available applications
that can span data centers. The Microsoft Cloud Platform powered by
Rackspace helps you realize your data center transformation goals by
delivering enterprise-class capabilities including best-in-class
management of your Windows Server infrastructure and first-party
Microsoft workloads.

Rackspace has worked directly with Microsoft to design a product line
architecture (PLA)-compliant cloud to help our customers develop and
implement private cloud infrastructures quickly while reducing
complexity and risk. The Microsoft Cloud Platform powered by Rackspace
provides a solution that combines Microsoft software, consolidated
guidance, and best-practice architecture with Rackspace's vast
experience providing Fanatical Support^&reg;^ hosting and supporting
solutions for compute, network, and storage architectures.

The Microsoft Private Cloud PLA uses the core capabilities of the
Microsoft Windows Server operating system, Hyper-V, and System Center to
deliver a private cloud infrastructure as a service offering. Following
are the key software features and components used for every
implementation hosted at Rackspace.

### Cloud Platform Base Cloud

Base Cloud is a basic System Center 2012 R2 plus Windows Azure Pack that
allows for the minimum compliant Cloud Platform. It is composed of the
following applications and roles:

| Application or role    | VM name    | Quantity | Software suite     | vCPU | vRAM | vDisk  |
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


The minimum system requirements to run the Base Cloud components are 60
vCPU, 136 GBs of RAM, and 3 TB of storage.  This workload is split
across two physical host servers that are configured in a failover
cluster.

### Additional Cloud Platform components

In addition to the Base Cloud offering, there are three optional add-on
services that you can use to enhance your Microsoft Cloud Platform at
Rackspace.  You can deploy one, two, or all three of these services.
Keep in mind that if you add any of them, the minimum required compute
and storage needs to account for the additional compute and storage
loads.

### Web Sites Cloud

Web Sites Cloud is a service that helps you provide a high-density,
scalable, shared web hosting platform for ASP.NET, PHP, and Node.js web
applications. The Web Sites Cloud service includes a customizable web
application gallery of open source web applications that integrate with
source control systems for custom-developed websites and applications.

With Microsoft SQL Server and MySQL Server, you can create the ideal
environment to leverage database as a service (DBaaS) for your company,
bringing it into the cloud era while maintaining private cloud security.
You can add one or more Microsoft SQL Server or MySQL Server instances
for tenants to deploy and use. Tenants use these databases with the Web
Sites Cloud service.

| Application or role    | VM name    | Quantity | Software suite     | vCPU | vRAM | vDisk  |
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
are 24 vCPU, 56 GB of RAM, and 1 TB of storage.  This workload is in
addition to the Base Cloud system, which is split across two physical
host servers configured in a failover cluster.

### Service Bus

The Service Bus service provides reliable messaging services between
distributed applications. The Service Bus service includes queued and
topic-based publish and subscribe capabilities.

| Application or role | VM name | Quantity | Software suite     | vCPU | vRAM | vDisk |
|---------------------|---------|----------|--------------------|------|------|-------|
| Service Bus         | SB      |     1    | Windows Azure Pack | 2    | 4 GB | 60 GB |

The minimum system requirements to run the Service Bus component are 2
vCPU, 4 GB of RAM, and 60 GB of storage.  This workload is in addition
to the Base Cloud system, which is split across two physical host
servers configured in a failover cluster.

### Active Directory Federation Services

Active Directory Federation Services (ADFS) provides simplified, secured
identity federation and web single sign-on (SSO) capabilities for end
users who want to access applications within an ADFS-secured enterprise,
in federation partner organizations, or in the cloud.

| Application or role                  | VM name | Quantity | Software suite     | vCPU | vRAM | vDisk |
|--------------------------------------|---------|----------|--------------------|------|------|-------|
| Active Directory Federation Services | ADFS    | 2        | Windows Azure Pack | 2    | 4 GB | 60 GB |

The minimum system requirements to run the ADFS component are 4 vCPU, 8
GB of RAM, and 120 GB of storage.  This workload is in addition to the
Base Cloud system, which is split across two physical host servers
configured in a failover cluster.
