---
permalink: private-cloud-default-values/
audit_date:
title: Private cloud default values
type: article
created_date: '2020-04-01'
created_by: Chad Sterling
last_modified_date: '2020-04-01'
last_modified_by: Chad Sterling
product: Account Management
product_url: account-management
---

## Rackspace Private Cloud default values

|--------------------------------|----------------------------------|
|**Data Center Time Zone:**      | Set Local to data center, time is NTP synced. Servers use a Rackspace caching name server by default as its resolver.|
|**System Locale:** | Local to data center (Windows), en_US (Linux)|
|**Patching:** | Rackspace automatic patching (Windows), nightly (Linux)|

|--------------------------------|----------------------------------|
|**Naming Defaults:**| Rackspace-generated six digit number + indication of intended use and numeric tag --> e.g. 123456-web2|

|--------------------------------|----------------------------------|
|**Partitioning Defaults:**|
|**Windows:|
All servers are set up with a single C:\ partition, then D:\ for second Raid, E:\ for third RAID, etc.
Linux:
Ubuntu/RHEL/CentOS 6+
Size --> Partition --> Mount Point:
1GB --> Physical (/dev/sda1) --> /boot
pv0 --> Physical volume
vglocalyyyymmdd --> Volume Group
2GB --> LVM (vglocalyyyymmdd-swap00) --> Swap
2GB --> LVM (vglocalyyyymmdd-tmp00) --> /tmp
Remainder -->LVM (vglocalyyyymmdd-root00) --> /
The default filesystem type is ext4


Rackspace SQL Server Defaults:
Version: As specified in your agreement
Service Pack: Latest supported will be installed
Instance Name: MSSQLSERVER
Features:
Database Engine and Services (e.g., Replications and Full-Text Search)
SQL Client Tools
SSMS - Latest supported and only applies to SQL Server 2016 and 2017
Collation:
For US based Data Centers: SQL_Latin1_General_CP1_CI_AS
For UK based Data Centers: Latin1_General_CI_AS
Port: 1433
Max Memory: Apply best practice
Drive Format: 64k allocation unit size
———————————————————————————————
SQL Customization:
You have asked us to install Microsoft SQL Server on your server.
Please take a moment to review and answer the below questions.
Will you require multiple named instances installed if so provide the additional names?
Where would you like your database files (data, log, tempdb, and backup) to reside?
For optimal performance the database and OS files should reside on separate drives.

Make your selection below if you require the additional SQL features installed.
Note: Web Edition only supports Reporting Services
[ ] Data Quality Services
[ ] Data Quality Client
[ ] Distributed Replay Controller
[ ] Distributed Replay Client
[ ] Reporting Services - SharePoint
[ ] Reporting Services Add-in for SharePoint Products
[ ] Reporting Services*
[ ] Integration Services*
[ ] Analysis Services*
*If requested the customer is responsible for configuring these features.
Requests to configure these features are on a reasonable endeavor basis.
Applicable for Microsoft SQL Server 2016 and 2017
[ ] R Services (In-Database)
[ ] PolyBase Query Service for External Data
[ ] Master Data Services - Applies to Enterprise Edition
[ ] R Server (Standalone) - Applies to Enterprise Edition
Applicable for Microsoft SQL Server 2016 and 2017
The Grant Perform Volume Maintenance Task privilege improves performance when creating or extending database files, but can allow deleted content to be access by an unauthorized user.
Enable 'Grant Performance Volume Maintenance Task privilege to SQL Server Database Engine Service'.
[ ] Yes
[ ] No


Domain: WORKGROUP, unless specified / "intensive" domain for Intensive SLA

Windows Cluster Defaults:
Cluster Configuration: Active\Passive
Clustered File Share Required: No
Domain Setup for Clustering: Customer AD

Linux Defaults:
MySQL Version:
MySQL 5.5 on RHEL 6/CentOS 6
MariaDB on RHEL7 /CentOS 7

Linux Cluster Defaults:
Clustered NFS Share: Default is one large NFS Share, unless otherwise specified.

Network Defaults:
- Firewall Only:  Flat Segment labeled as “FW-INSIDE”
- With Load Balancer:  2 additional segments – “Load Balanced DMZ” and "FW-LB”
- With Hypervisor: (Hyper-V and vSphere Management): 1 additional segment – Secure “HYP-MGMT”
Note: VMNet is standard when there is a hypervisor.

Devices identified as Web servers will belong to the DMZ segment, DB servers to the INSIDE segment

Default Ranges:
FW-INSIDE network: 172.24.16.0/22
DMZ network: 172.24.32.0/22
RackConnect: 172.24.48.0/22
DR: 172.25.0.0
VPNs:     A VPN questionnaire will be provided via ticket.

Storage Defaults:
Please note: Each LUN needs a minimum of 50 GB and we can expand in increments of 25GB.

Datastores: If no datastores are chosen, Rackspace Implementation Engineering will choose based on space and availability. Database devices will go on RAID 10 LUNs and everything else will go on RAID 5 or wherever there is space.

Virtualization Defaults:
Clustering: If there is an existing cluster, the new hypervisor(s) will be joined to that cluster unless instructed otherwise.
***END RACKSPACE CONFIGURATION DEFAULTS***
