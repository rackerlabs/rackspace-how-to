---
permalink: cloud-servers-with-managed-operations-support-for-windows/
audit_date: '2017-01-10'
title: Cloud Servers with Managed Operations support for Windows
type: article
created_date: '2011-03-16'
created_by: David Hendler
last_modified_date: '2017-01-19'
last_modified_by: Hounsou Dansou
product: Managed Operations
product_url: managed-operations
---

Managed Operations provides support beyond Managed Infrastructure,
including direct assistance with resizes, snapshots, host machine
issues, adding and removing servers, and managing IP addresses. To
ensure Fanatical Support, Rackspace provides support for specific
software and server configurations on Cloud Servers with Managed
Operations.

### Operating systems

The Managed Operations spheres of support include the following
operating systems for Windows cloud servers:

- [Windows Server 2008 with Service Pack
 R2](http://technet.microsoft.com/library/dd349801)

- [Windows Server 2012 with Service Pack
 R2](http://technet.microsoft.com/en-US/windowsserver/hh534429)

**Note:** Detailed information on Linux support can be found in [Cloud
Servers with Managed Operations support for
Linux](/how-to/cloud-servers-with-managed-operations-support-for-linux).

#### IIS 7, 7.5

|    | **Installation** | **Configuration** | **Troubleshooting** | **Monitoring** | **Patching** |
| --- | --- | --- | --- | --- | --- |
| [Web HTTP/HTTPS](http://www.iis.net/) |**Yes** | **Yes** | **Yes** | **Yes** | **Yes** |
|[FTP](http://www.iis.net/) | **Yes** | **Yes** | **Yes** |**Yes** | **Yes** |

#### IIS 8, 8.5

|    | **Installation** | **Configuration** | **Troubleshooting** | **Monitoring** | **Patching** |
| --- | --- | --- | --- | --- | --- |
| [Web HTTP/HTTPS](http://www.iis.net/) |**Yes** | **Yes** | **Yes** | **Yes** | **Yes** |
| [FTP](http://www.iis.net/) | **Yes** | **Yes** | **Yes** |**Yes** | **Yes** |

### Database servers

|    | **Installation** | **Configuration** | **Troubleshooting** | **Monitoring** | **Patching** |
| --- | --- | --- | --- | --- | --- |
| [SQL Server 2008 R2 (Standard and Web Edition)](http://www.microsoft.com/en-us/server-cloud/products/sql-server/) |**Yes** | **Yes** | **Yes** | **Yes** | **Yes** |
| [SQL Server 2012 (Standard and Web Edition)](http://www.microsoft.com/en-us/server-cloud/products/sql-server/)| **Yes** |**Yes** | **Yes** | **Yes** | **Yes** |
| [SQL Server 2014 (Standard and Web Edition)](http://www.microsoft.com/en-us/server-cloud/products/sql-server/)| **Yes** | **Yes** | **Yes** | **Yes** | **Yes** |
| [MySQL](http://www.mysql.com/why-mysql/windows/) | **Yes** | No | No | **Yes** | No |

**Note:** Rackspace does not support SQL express 2008, 2012, and 2014.

#### Programming languages

|    | **Installation** | **Configuration** | **Troubleshooting** | **Monitoring** | **Patching** |
| --- | --- | --- | --- | --- | --- |
| [ASP](https://msdn.microsoft.com/en-us/library/aa286483.aspx) |**Yes** | **Yes** | **Yes** | **Yes** | **Yes**|
| [ASP.NET](http://www.asp.net/) | **Yes** | **Yes** |**Yes** | **Yes** | **Yes** |
| [PHP (Fast CGI)](http://www.php.net/) | **Yes** | **Yes** | No | No | No |

#### Software firewall

|    | **Installation** | **Configuration** | **Troubleshooting** |
| --- | --- | --- | --- |
| [Windows Firewall](http://windows.microsoft.com/en-us/windows-8/windows-firewall-from-start-to-finish)| **Yes** | **Yes**| **Yes** |

#### FTP

|    | **Installation** | **Configuration** | **Troubleshooting** | **Monitoring** | **Patching** |
| --- | --- | --- | --- | --- | --- |
| [IIS 7.5 FTPS](https://www.microsoft.com/en-us/download/details.aspx?id=14045) |**Yes** | **Yes** | **Yes** | **Yes** | **Yes** |
| [IIS 8.5 FTPS](https://technet.microsoft.com/en-us/library/hh831655.aspx)| **Yes** | **Yes** | **Yes** | **Yes** | **Yes** |

#### SMTP

|    | **Installation** | **Configuration** | **Troubleshooting** | **Monitoring** | **Patching** |
| --- | --- | --- | --- | --- | --- |
| IIS Outgoing Only](http://www.iis.net/) |**Yes** | **Yes** | **Yes** | **Yes** | No |

#### Active Directory (US Only)

| Supported | Windows 2008 R2| Windows 2012 R2|
| --------- | -------------| ------------ |
| Set up AD Controller | **Yes** | **Yes** |
|Add Users to AD | **Yes** | **Yes** |
| [Establish AD Trust to customer's on-premises AD (their DC) using RackConnect](https://www.rackspace.com/cloud/hybrid/rackconnect) |**Yes** | **Yes** |
| Establish AD Trust between customer's dedicated and cloud environments, hosted at Rackspace | **Yes** |**Yes** |
| Establish AD Trust to Rackspace Intensive domain | No | No |
| Replication | **Yes** | **Yes** |
| Authentication for Web | **Yes** | **Yes** |
| Internal DNS for Active Directory |**Yes** | **Yes** |
| LDAP | **Yes** | **Yes** |
|Application partitions when using other Rackspace Application Services (for example, SharePoint and Exchange) | **Yes** | **Yes** |
|Development for Federated Services | No | No |
| Development for Application integration | No | No |
| Snapshots or Backups of Domain Controller | No | No |
| Group Policy Objects | No | No |
| Distributed File System (DFS) | No | No |
| RackConnect to Dedicated environment |**Yes** | **Yes** |
| Multiple Domain Controllers | **Yes** | **Yes** |
| Rights Management | No | No |
| Federated Services | No | No |
| CA Services | No | No |

### Other packages

<span>While we do not support all technologies, we do offer reasonable-endeavor
support which extends our support into offering alternative solutions. The
reasonable-endeavor support can include help from Rackspace partners and other
third party services.

-   **Load Balancing** - Support is provided through the use of Cloud
    Load Balancers.

-   **Email** - Support is provided through Rackspace Email and using
    IIS SMTP on the server. Cloud Servers with a Managed Service Level
    are pre-configured to use Mailgun, our mail relay service, to ensure
    reliable mail delivery. The first 50,000 emails sent each month are
    free, and your mail package can be upgraded if higher volume
    is expected. For more details see our [Mailgun Rackspace pricing
    page](http://www.mailgun.com/rackspace).

-   **DNS** - The use of the Rackspace Cloud nameservers for DNS
    is supported. Windows DNS is currently not supported.

-   **Exchange** - Exchange is not supported at this time.

-   **SharePoint** - SharePoint is not supported at this time.

-   **Terminal Services** - We will install the role and license.

-   **Cloud Files** - Integration with Cloud Files is supported by using the
    API, however no development assistance will be offered with using the API.

### End of life support dates

Rackspace makes every effort to align our support dates for operating
systems with the manufacturer's support dates. The end-of-life support
dates listed are provided by the manufacturer and are subject to change.
If the manufacturer decides to shorten the support life of an
operating system, Rackspace may be forced to end support sooner than the
published date.

| Operating System Name | End of Life Support Date |
|--------------------- | ------------------------ |
| Windows Server 2008 R2 | January 14, 2020 |
| Windows Server 2012 R2 | January 10, 2023 |
