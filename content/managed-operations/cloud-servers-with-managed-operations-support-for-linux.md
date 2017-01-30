---
permalink: cloud-servers-with-managed-operations-support-for-linux/
audit_date: '2016-11-28'
title: Cloud Servers with Managed Operations support for Linux
type: article
created_date: '2011-05-26'
created_by: David Hendler
last_modified_date: '2016-11-28'
last_modified_by: Nate Archer
product: Managed Operations
product_url: managed-operations
---

The Managed Operations service level provides support beyond the Managed Infrastructure service level, including direct
assistance with resizes, snapshots, host machine issues, adding and removing servers, and managing IP addresses. To
ensure Fanatical Support®, Rackspace provides support for specific software and server configurations on Linux cloud
servers with Managed Operations support.

**Note:** For information about Windows support, see [Cloud Servers with Managed Operations support for Windows](/how-to/cloud-servers-with-managed-operations-support-for-windows).

### Operating systems

The Managed Operations service level supports the following operating systems for Linux cloud servers:

- CentOS 7 (PVHVM)
- CentOS 6 (PVHVM)
- Debian 8 (Jessie) (PVHVM)
- Debian 7 (Wheezy) (PVHVM)
- Red Hat Enterprise Linux 7 (PVHVM)
- Red Hat Enterprise Linux 6 (PVHVM)
- Ubuntu 16.04 LTS (Xenial Xerus) (PVHVM) 
- Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM)
- Ubuntu 12.04 LTS (Precise Pangolin) (PVHVM)
- Vyatta Network OS (6.7R9)

**Note:** Rackspace makes every effort to align our support dates for operating systems with the manufacturer's support dates. If a manufacturer decides to shorten the support life of an operating system, Rackspace might be forced to end support sooner than originally anticipated.

### Web Servers

The Managed Operations service level supports the following types of web servers:

|    | **Installation** | **Configuration** | **Troubleshooting** | **Monitoring** | **Patching** |
| --- | --- | --- | --- | --- | --- |
| [**Apache**](http://httpd.apache.org/) | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** |
| [**lighttpd**](http://www.lighttpd.net) | **Yes** | No | No | **Yes** | **Yes** |
| [**NGINX**](http://nginx.net) | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** |

### Database Servers

The Managed Operations service level supports the following types of database servers:

|    | **Installation** | **Configuration** | **Troubleshooting** | **Replication** | **Monitoring** | **Patching** | **Backup** |
| --- | --- | --- | --- | --- | --- | --- | --- |
| [**MySQL/**](http://www.mysql.com) [**MariaDB**<sup>2</sup>](http://mariadb.org) | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** |
| [**Oracle**](http://www.oracle.com/us/products/database/index.html) | No | No | No | No | No | No | No |
| [**PostgreSQL**](http://postgresql.com) | **Yes** | No | No | No | **Yes** | No | No |
| [**MongoDB**](http://www.mongodb.org/) | **Yes** | No | No | No | No | No | No |

<sup>1</sup>MariaDB is supported for Red Hat Enterprise Linux 7 and CentOS 7

<sup>2</sup>Only Master/Slave replication is supported

### Programming languages

The Managed Operations service level supports the following programming languages:

**Note:** Support for programming languages is limited to installation and does not include assistance with code or add-on
frameworks like Ruby on Rails.

|   | **Installation** | **Configuration** | **Modules** | **Patching** |
| --- | --- | --- | --- | --- |
| [**Perl**](http://www.perl.org) | **Yes** | No | **Yes** | **Yes** |
| [**PHP**](http://www.php.net) | **Yes** | **Yes** | **Yes** | **Yes** |
| [**Python**](http://www.python.org) | **Yes** | **Yes** | **Yes** | **Yes** |
| [**Ruby**](http://www.ruby-lang.org) | **Yes** | **Yes** | **Yes** | **Yes** |


### Caching

The Managed Operations service level supports the following caching tools:

|    | **Installation** | **Configuration** | **Troubleshooting** | **Patching** |
| --- | --- | --- | --- | --- |
| [**Memcached**](http://memcached.org) | **Yes** | **Yes** | **Yes** | **Yes** |
| [**Squid**](http://squid-cache.org) | **Yes** | No | No | **Yes** |
| [**Varnish**](http://varnish-cache.org) | **Yes** | **Yes** | Yes | **Yes** |


### Software firewall

The Managed Operations service level supports the following firewall software:

|    | **Installation** | **Configuration** | **Troubleshooting** |
| --- | --- | --- | --- |
| [**iptables**](http://www.netfilter.org/projects/iptables/) | **Yes** | **Yes** | **Yes** |
| [**UBUNTU ufw**](https://wiki.ubuntu.com/UncomplicatedFirewall) | **Yes** | **Yes** | **Yes** |


### FTP

The Managed Operations service level supports the following FTP tool:

|    | **Installation** | **Configuration** | **Troubleshooting** | **Monitoring** | **Patching** |
| --- | --- | --- | --- | --- | --- |
| [**vsftpd**](https://security.appspot.com/vsftpd.html) | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** |


### SMTP

The Managed Operations service supports the following SMTP tool:

|    | **Installation** | **Configuration** | **Troubleshooting** | **Monitoring** | **Patching** |
| --- | --- | --- | --- | --- | --- |
| [**Postfix, outgoing only**](http://www.postfix.org/) | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** |


### Other packages

Although we don’t support all technologies, we do offer reasonable endeavor support, which extends our support into
offering alternative solutions. Reasonable endeavor support can include help from Rackspace partners and other thirdparty
services.

-  **API support**:  Managed Operations offers all the support functions listed in the [developer guides](https://developer.rackspace.com/docs/).
-  **Cloud Files**:  Integration with Cloud Files is supported via the API, however no development support is offered to help utilize Cloud Files via the API.
-  **Load Balancing**: Cloud Load Balancers are supported by Managed Operations.
-  **Email**:  The default SMTP configuration for outbound email on Linux is through Postfix.  Cloud Servers with a Managed Operations service level are preconfigured to use our mail relay service Mailgun to ensure reliable mail delivery.  The first 50,000 emails sent each month are free, and your mail package can be upgraded if higher volume is expected. For more information, see the [Mailgun Rackspace pricing page](http://www.mailgun.com/rackspace).
-  **Firewalls**: Support is provided for  [iptables](http://www.netfilter.org/),  [Ubuntu ufw](https://help.ubuntu.com/community/UFW), and  [fail2ban](http://www.fail2ban.org/wiki/index.php/Main_Page).
-  **Control Panels**: Control panel applications such as Plesk, Webmin, or cPanel are  *not* supported at this time.
-  **DNS**: Managed Operations supports the use of the Rackspace Cloud name servers for DNS.  Bind is *not* supported at this time.


