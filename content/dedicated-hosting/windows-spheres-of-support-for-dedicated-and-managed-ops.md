---
permalink: windows-spheres-of-support-for-dedicated-and-managed-ops/
audit_date: '2018-08-03'
title: Windows Spheres of Support for Dedicated and Managed Operations
type: article
created_date: '2018-08-02'
created_by: JP gonzalez
last_modified_date: '2018-10-31'
last_modified_by: Nick Kidd
product: Dedicated Hosting
product_url: dedicated-hosting
---

This article outlines Rackspace support for software and server configurations for virtual and physical machines that run a supported Microsoft Windows® operating system. The article presents a high-level overview of Rackspace offerings. Contact Rackspace Sales or your account representative for more information regarding the components of specific Windows roles and features that are supported in Rackspace offerings.



### Operating system

The following operating systems are supported for both Dedicated and Managed Clouds:

| OS Version             | Dedicated | Microsoft Private Cloud | Rackspace Public Cloud | Azure Public Cloud | AWS  Public Cloud | Google  Public Cloud |
|------------------------|-----------|-------------------------|------------------------|--------------------|-------------------|----------------------|
| Windows Server 2008    | Yes       |                         |                        |                    |                   |                      |
| Windows Server 2008 R2 | Yes       |                         |                        | Yes                |                   |                      |
| Windows Server 2012    | Yes       |                         |                        |                    |                   |                      |
| Windows Server 2012 R2 | Yes       | Yes                     | Yes                    | Yes                | Yes               | Yes                  |
| Windows Server 2016    | Yes       | Yes                     |                        | Yes                | Yes               | Yes                  |
| Windows Server 2019    | Yes       | Yes                     |                        | Yes                | Yes               | Yes                  |

**Note**: Rackspace makes every effort to align our support dates for operating systems with the manufacturer's support dates. If a manufacturer decides to shorten the support life of an operating system, Rackspace might be forced to end support sooner than originally anticipated. For full details on support life, see the [Rackspace EOL Terms](https://www.rackspace.com/information/legal/eolterms).



### Web servers

The following types of web servers (IIS) are supported in the indicated areas:

|                | Installation | Configuration | Troubleshooting |
|----------------|--------------|---------------|-----------------|
| IIS 7          | Yes          | Yes           | Yes             |
| IIS 7.5        | Yes          | Yes           | Yes             |
| IIS 8          | Yes          | Yes           | Yes             |
| IIS 8.5        | Yes          | Yes           | Yes             |
| IIS 10         | Yes          | Yes           | Yes             |
| Web HTTP/HTTPS | Yes          | Yes           | Yes             |
| FTP            | Yes          | Yes           | Yes             |
| FTPS           | Yes          | Yes           | Yes             |
| SMTP           | Yes          | Yes           | Yes             |
| PHP            | Yes          | Yes           | Yes             |
| PHP Extensions | Yes          | Yes           | Yes             |

**Note**: Not all add-on modules are supported. Contact Rackspace Support for more information.



### Active Directory

| Feature/Operation | Installation | Configuration | Troubleshooting |
|---------------------|--------------|---------------|-----------------|
| Domain Services     | Yes          | Yes           | Yes             |
| DNS                 | Yes          | Yes           | Yes             |



### Remote Desktop Services

| Feature/Operation             | Installation | Configuration | Troubleshooting |
|---------------------------------|--------------|---------------|-----------------|
| Remote Desktop Licensing Server | Yes          | Yes           | Yes             |
| Remote Desktop Session Host     | Yes          | Yes           | Yes             |



### Miscellaneous roles and features

| Feature/Operation             | Installation | Configuration | Troubleshooting |
|---------------------------------|--------------|---------------|-----------------|
| ODBC                            | Yes          | Yes           | Yes             |
| Failover Clustering             | Yes          | Yes           | Yes             |
| File and Storage Services       | Yes          | Yes           | Yes             |
| Windows Firewall                | Yes          |               |                 |
| Windows Server Backup           | Yes          |               |                 |
| DFS-R (Distributed File System) | Yes          | Yes           | Yes             |



### Additional products and services

| Feature/Operation                             | Installation | Configuration | Troubleshooting |
|-------------------------------------------------|--------------|---------------|-----------------|
| Microsoft Exchange                              | Yes          | Yes           | Yes             |
| Microsoft Sharepoint                            | Yes          |               |                 |
| Microsoft Office                                | Yes          | Yes           | Yes             |
| SSL Certificates                                | Yes          |               |                 |
| Compliance Assistance                           |              | Yes           |                 |
| Microsoft SQL                                   | Yes          | Yes           | Yes             |
| Rackspace Managed Antivirus                     | Yes          | Yes           | Yes             |
| Rackspace Managed Backup                        | Yes          | Yes           | Yes             |
| Racksapce Windows Server Update Services (WSUS) | Yes          |               |                 |

**Note**: Additional Rackspace licensing and service agreements are required.



### Microsoft SQL

The following types of database servers are supported in the indicated areas:

## Supported OS and MSSQL combinations

| MSSQL version | Windows 2008 32 bit | Windows 2008 64 bit | Windows 2012 64 bit | Windows 2012 R2 64 bit | Windows 2016 | Windows 2019 |
|---------------|---------------------|---------------------|---------------------|------------------------|--------------|--------------|
| MSSQL 2008    | Yes                 | Yes                 |                     |                        |              |              |
| MSSQL 2008 R2 | Yes                 | Yes                 |                     |                        |              |              |
| MSSQL 2012    |                     |                     | Yes                 | Yes                    |              |              |
| MSSQL 2014    |                     |                     | Yes                 | Yes                    | Yes          |              |
| MSSQL 2016    |                     |                     |                     | Yes                    | Yes          |              |
| MSSQL 2017    |                     |                     |                     |                        | Yes          | Yes          |
| MSSQL 2019    |                     |                     |                     |                        | Yes          | Yes          |

## Supported platforms for Microsoft SQL editions

| MSSQL edition | Licensing | Installation | Troubleshooting | Managed backup |
|---------------|-----------|--------------|-----------------|----------------|
| Web           | Yes       | Yes          | Yes             | Yes            |
| Standard      | Yes       | Yes          | Yes             | Yes            |
| Enterprise    | Yes       | Yes          | Yes             | Yes            |

**Note**: Customers who use MSDN licenses for Microsoft SQL are free to install and run this edition of SQL. However, Rackspace cannot provide an MSDN license, install MSDN software, monitor MSDN applications, or back up the MSDN applications by using the Rackspace Managed Backup for MSSQL offering. Also note that the use of production data in an instance that is licensed via MSDN is strictly prohibited.				


## Supported platforms for Microsoft SQL licenses

| Licensing                    | Managed Colo | Managed | Intensive | Managed Operations (Cloud) | Navigator (AWS) | Aviator (AWS) | Navigator (Azure) | Navigator (Azure) |
|------------------------------|--------------|---------|-----------|----------------------------|-----------------|---------------|-------------------|-------------------|
| Rackspace-owned licenses     | Yes*         | Yes     | Yes       | Yes                        |                 |               |                   |                   |
| Customer-provided licenses   | Yes          | Yes     | Yes       |                            | Yes             | Yes           | Yes               | Yes               |
| AWS image library licenses   |              |         |           |                            | Yes             | Yes           |                   |                   |
| AWS RDS                      |              |         |           |                            | Yes             | Yes           |                   |                   |
| Azure image library licenses |              |         |           |                            |                 |               | Yes               | Yes               |
| Azure SQL Database           |              |         |           |                            |                 |               | Yes               | Yes               |

**Note**: Licensing is limited to bare metal servers and Enterprise edition on hypervisors only.


## Supported platforms for Microsoft SQL installation

| Support                      | Managed Colo | Managed | Intensive | Managed Operations (Cloud) | Navigator (FAWS) | Aviator (FAWS) | Navigator (Azure) | Navigator (Azure) |
|------------------------------|--------------|---------|-----------|----------------------------|------------------|----------------|-------------------|-------------------|
| Rackspace-owned licenses     | *            | Yes**   | Yes**     | Yes                        |                  |                |                   |                   |
| Customer-provided licenses   | *            | Yes**   | Yes**     |                            |                  | Yes            |                   | Yes               |
| AWS image library licenses   |              |         |           |                            | Yes*             | Yes            |                   |                   |
| AWS RDS                      |              |         |           |                            | Yes*             | Yes            |                   |                   |
| Azure image library licenses |              |         |           |                            |                  |                | Yes*              | Yes               |
| Azure SQL Database           |              |         |           |                            |                  |                | Yes*              | Yes               |

* Support is available with DBAssist Hourly Services only.
** Not supported on Unmanaged VMs except for DBAssist Hourly Services.

### Other services and technologies

Although we don't support all technologies, we do offer *reasonable endeavor* support, which extends our support into offering alternative solutions. Reasonable endeavor support can include help from Rackspace partners and other third-party services.

-  **API support**: All of the support functions listed in the [API guides](https://developer.rackspace.com/docs) are supported.
-  **Cloud Files**: Integration with Cloud Files is supported through the API. However, we do not offer development support for using the Cloud Files API.
-  **DNS**: Rackspace supports the use of the public Rackspace name servers for DNS. Named servers that use BIND are not supported at this time.
-  **Load Balancing**: Rackspace Cloud Load Balancers are supported.

#### Disclaimer

**The information contained in this document is a general introduction to the Rackspace Services and does not include any legal commitment on the part of Rackspace.**

You should not rely solely on this document to decide whether to purchase the service. Rackspace detailed services descriptions and legal commitments are stated in its services agreements. Rackspace services’ features and benefits depend on system configuration and may require enabled hardware, software, or additional services activation.

Except as set forth in Rackspace general terms and conditions, cloud terms of services, and/or other agreements you sign with Rackspace, Rackspace assumes no liability whatsoever, and disclaims any express or implied warranty, relating to its services including, but not limited to, the implied warranty of merchantability, fitness for a particular purpose, and no infringement.

Although part of the document explains how Rackspace services may work with third-party products, the information contained in the document is not designed to work with all scenarios. Any use or changes to third-party products and/or configurations should be made at the discretion of your administrators and are subject to the applicable terms and conditions of such third party. Rackspace does not provide technical support for third-party products, other than specified in your hosting services or other agreement you have with Rackspace, and Rackspace accepts no responsibility for third-party products.

Rackspace cannot guarantee the accuracy of any information presented after the date of publication. Rackspace&reg; and other Rackspace marks are either registered service marks or service marks of Rackspace US, Inc. in the United States and other countries. All other trademarks, service marks, images, products, and brands remain the sole property of their respective holders and do not imply endorsement or sponsorship.
