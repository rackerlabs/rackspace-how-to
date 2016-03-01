---
node_id: 1105
title: Cloud Servers with Managed Operations support for Linux
type: article
created_date: '2011-05-26'
created_by: David Hendler
last_modified_date: '2016-01-21'
last_modified_by: Zach Corleissen
product: Managed Operations
product_url: managed-operations
---

Managed Operations provides support beyond Managed Infrastructure, including direct assistance with resizes, snapshots, host machine issues, adding and removing servers, and managing IP addresses. To ensure Fanatical Support, Rackspace provides support for specific software and server configurations on Cloud Servers with Managed Operations support.

### Operating systems

The Managed Operations spheres of support include the following operating systems for Linux cloud servers:

- CentOS 7 (PVHVM)
- CentOS 6 (PVHVM)
- Debian 8 (Jessie) (PVHVM)
- Debian 7 (Wheezy) (PVHVM)
- Red Hat Enterprise Linux 7 (PVHVM)
- Red Hat Enterprise Linux 6 (PVHVM)
- Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM)
- Ubuntu 12.04 LTS (Precise Pangolin) (PVHVM)
- Vyatta Network OS (6.7R9)

**Note:**  Information on Windows support can be found in  [Cloud Servers with Managed Operations support for Windows](/how-to/cloud-servers-with-managed-operations-support-for-windows).

### Web Servers

|    | **Installation** | **Configuration** | **Troubleshooting** | **Monitoring** | **Patching** |
| --- | --- | --- | --- | --- | --- |
| [**Apache**](http://httpd.apache.org/) | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** |
| [**lighttpd**](http://www.lighttpd.net) | **Yes** | No | No | **Yes** | **Yes** |
| [**Nginx**](http://nginx.net) | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** |

### Database Servers

|    | **Installation** | **Configuration** | **Troubleshooting** | **Replication** | **Monitoring** | **Patching** | **Backup** |
| --- | --- | --- | --- | --- | --- | --- | --- |
| [**MySQL/**](http://www.mysql.com) [**MariaDB \***](http://mariadb.org) | **Yes** | **Yes** | **Yes** | **Yes\*\*** | **Yes** | **Yes** | **Yes** |
| [**Oracle**](http://www.oracle.com/us/products/database/index.html) | No | No | No | No | No | No | No |
| [**PostgreSQL**](http://postgresql.com) | **Yes** | No | No | No | **Yes** | No | No |
| [**MongoDB**](http://www.mongodb.org/) | **Yes** | No | No | No | No | No | No |

\*MariaDB is supported for RHEL 7 and CentOS 7
\*\*Only Master/Slave replication is supported

### Programming languages

|   | **Installation** | **Configuration** | **Modules** | **Patching** |
| --- | --- | --- | --- | --- |
| [**Perl**](http://www.perl.org) | **Yes** | No | **Yes** | **Yes** |
| [**PHP**](http://www.php.net) | **Yes** | **Yes** | **Yes** | **Yes** |
| [**Python**](http://www.python.org) | **Yes** | **Yes** | **Yes** | **Yes** |
| [**Ruby**](http://www.ruby-lang.org) | **Yes** | **Yes** | **Yes** | **Yes** |

\*Support for programming languages is limited to installation and does not include assistance with code or add-on frameworks like Ruby on Rails.


### Caching

|    | **Installation** | **Configuration** | **Troubleshooting** | **Patching** |
| --- | --- | --- | --- | --- |
| [**Memcached**](http://memcached.org) | **Yes** | **Yes** | **Yes** | **Yes** |
| [**Squid**](http://squid-cache.org) | **Yes** | No | No | **Yes** |
| [**Varnish**](http://varnish-cache.org) | **Yes** | **Yes** | Yes | **Yes** |


### Software firewall

|    | **Installation** | **Configuration** | **Troubleshooting** |
| --- | --- | --- | --- |
| [**IPTABLES**](http://www.netfilter.org/projects/iptables/) | **Yes** | **Yes** | **Yes** |
| [**UBUNTU UFW**](https://wiki.ubuntu.com/UncomplicatedFirewall) | **Yes** | **Yes** | **Yes** |


### FTP

|    | **Installation** | **Configuration** | **Troubleshooting** | **Monitoring** | **Patching** |
| --- | --- | --- | --- | --- | --- |
| [**VSFTPD**](https://security.appspot.com/vsftpd.html) | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** |


### SMTP

|    | **Installation** | **Configuration** | **Troubleshooting** | **Monitoring** | **Patching** |
| --- | --- | --- | --- | --- | --- |
| [**POSTFIX Outgoing ONLY**](http://www.postfix.org/) | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** |


### Other packages

While we do not support all technologies, we do offer reasonable endeavor support which extends our support into offering alternative solutions.  The reasonable endeavor support can include help from Rackspace partners and other third party services.

-  **API Support**  - Managed Operations offers all the support functions listed in the [developer guides](https://developer.rackspace.com/docs/).
-  **Cloud Files** -  Integration with Cloud Files is supported via the API, however no development assistance will be offered in utilization via the API.
-  **Load Balancing** - Cloud Load Balancers are supported by Managed Operations.
-  **Email**  - The default SMTP configuration for outbound email on Linux is through Postfix.  Cloud Servers with a Managed Operations service level are pre-configured to use our mail relay service Mailgun to ensure reliable mail delivery.  The first 50,000 emails sent each month are free, and your mail package can be upgraded if higher volume is expected. For more details see our [Mailgun Rackspace pricing page](http://www.mailgun.com/rackspace).
-  **Firewalls**  - Support is provided for  [IPTables](http://www.netfilter.org/),  [ufw](https://help.ubuntu.com/community/UFW), and  [fail2ban](http://www.fail2ban.org/wiki/index.php/Main_Page).
-  **Control Panels** - Control Panel applications such as Plesk, Webmin, or cPanel are  **not supported at this time**.
-  **DNS** - Managed Operations supports the use of the Rackspace Cloud nameservers for DNS.  Bind is **not supported at this time**.

### End of life support dates

Rackspace makes every effort to align our support dates for operating systems with the manufacturer's support dates. Should the manufacturer decide to shorten the support life of an operating system, Rackspace may be forced to end support sooner than originally anticipated.
