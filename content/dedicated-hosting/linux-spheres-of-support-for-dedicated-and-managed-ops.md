---
permalink: linux-spheres-of-support-for-dedicated-and-managed-ops/
audit_date: '2017-03-03'
title: Linux Spheres of Support for Dedicated and Managed Operations
type: product
created_date: '2017-03-03'
created_by: Alex Juarez
last_modified_date: '2017-03-03'
last_modified_by: Stephanie Fillmon
product: Dedicated Hosting
product_url: dedicated-hosting
---

The Linux Spheres of Support (SoS) outlines our Fanatical Support&reg; of software and server configurations for machines (virtual and physical) running a supported Linux operating system.

### Operating systems

Fanatical Support&reg; for Linux includes the following operating systems:

- CentOS 7
- CentOS 6
- Debian 8 (Jessie)<sup>1</sup>
- Debian 7 (Wheezy)<sup>1</sup>
- Red Hat Enterprise Linux 7
- Red Hat Enterprise Linux 6
- Ubuntu 16.04 LTS (Xenial Xerus)
- Ubuntu 14.04 LTS (Trusty Tahr)

<sup>1</sup>Only supported in Managed Cloud

**Note**: Rackspace makes every effort to align our support dates for operating systems with the manufacturer's support dates. If a manufacturer decides to shorten the support life of an operating system, Rackspace might be forced to end support sooner than originally anticipated. For full details on support life, see the [Rackspace EOL Terms](https://www.rackspace.com/information/legal/eolterms).

### Web servers

Fanatical Support&reg; for Linux supports the following types of web servers:

|   | Installation | Configuration | Troubleshooting | Patching |
| --- | --- | --- | --- | --- |
| Apache | Yes | Yes | Yes | Yes |
| NGINX | Yes | Yes | Yes | Yes |

**Note**: Not all add-on modules are support. Please contact Rackspace Support for further information.

### Database servers

Fanatical Support&reg; for Linux supports the following types of database servers:

|   | Installation | Configuration | Troubleshooting | Patching |
| --- | --- | --- | --- | --- |
| MySQL / MariaDB | Yes | Yes | Yes | Yes |
| Percona | Yes | Yes | Yes | Yes |

**Note**: Linux OS Administrators handle basic database support topics. Advanced topics may require DBA support assistance. PostgreSQL, MongoDB, and Oracle are not supported by Linux OS administrators. The Rackspace DBA team supports Oracle and MySQL, and PostgreSQL requests can be considered on a case-by-case basis. The Rackspace DBA team is available for support consultation on database issues, fees may apply.

### File servers

Fanatical Support&reg; for Linux supports the following file servers:

|   | Installation | Configuration | Troubleshooting | Patching |
| --- | --- | --- | --- | --- |
| Vsftpd | Yes | Yes | Yes | Yes |
| NFS | Yes | Yes | Yes | Yes |
| CIFS (client) | Yes | Yes | Yes | Yes |
| Lsyncd | Yes | Yes | Yes | Yes |

**Note**: While Lsyncd is not strictly a file server technology, we commonly use it at Rackspace in place of NFS services on cloud servers. Bidirectional data transfer with Lsyncd is unsupported.

### Mail servers

Fanatical Support&reg; for Linux supports the following mail servers:

|   | Installation | Configuration | Troubleshooting | Patching |
| --- | --- | --- | --- | --- |
| Postfix | Yes | Yes | Yes | Yes |
| Dovecot | Yes | Yes | Yes | Yes |

**Note**: By their nature, cloud servers have ephemeral IP addresses which most email providers blacklist. Sending emails from a cloud server must go through a third party such as [Mailgun](https://www.mailgun.com/).

### Application servers

Fanatical Support&reg; for Linux supports the following authentication tools:

|   | Installation | Configuration | Troubleshooting | Patching |
| --- | --- | --- | --- | --- |
| SSSD-AD | Yes | Yes | Yes | Yes |
| [Duo 2FA](https://duo.com/) | Yes | Yes | Yes | Yes |

### Caching

Fanatical Support&reg; for Linux supports the following caching tools:

|   | Installation | Configuration | Troubleshooting | Patching |
| --- | --- | --- | --- | --- |
| Memcached | Yes | Yes | Yes | Yes |
| Redis | Yes | Yes | Yes | Yes |
| Varnish | Yes | Yes | Yes | Yes |

**Note**: Rackspace does not support VCL customization for Varnish.

### Clustering (Red Hat Cluster Suite)

Fanatical Support&reg; for Linux supports the following services on RHCS:

|   | Installation | Configuration | Troubleshooting | Patching |
| --- | --- | --- | --- | --- |
| MySQL / MariaDB / Percona | Yes | Yes | Yes | Yes |
| NFS | Yes | Yes | Yes | Yes |
| Redis | Yes | Yes | Yes | Yes |

**Note**: RHCS is supported only on physical hardware platforms (not including OnMetal offerings). Oracle on RHCS is supported in tandem by the DBA team and Linux OS administrators.

### Control panels

Fanatical Support&reg; for Linux supports the following control panels:

|   | Installation | Configuration | Troubleshooting | Patching |
| --- | --- | --- | --- | --- |
| [Plesk](https://www.plesk.com/) | Yes | Yes | Yes | Yes |

**Note**: Only supported on dedicated RHEL/CentOS platforms.

### Anti-virus

Fanatical Support&reg; for Linux supports the following anti-virus software:

|   | Installation | Configuration | Troubleshooting | Patching |
| --- | --- | --- | --- | --- |
| Rackspace Managed Anti-Virus | Yes | Yes | Yes | Yes |

**Note**: Rackspace requires the use of anti-virus software on any configurations utilizing domain controllers and to assist in maintaining PCI compliance.

### Other services and technologies

Although we don't support all technologies, we do offer reasonable endeavor support, which extends our support into offering alternative solutions. Reasonable endeavor support can include help from Rackspace partners and other third-party services.

- **API support**: Fanatical Support&reg; for Linux offers all the support functions listed in the [developer guides](https://developer.rackspace.com/docs).
- **Backups**: Rackspace provides solutions for file system and database backups including leveraging the use of open source projects such as [Holland](http://docs.hollandbackup.org/). Please contact support for more information.  
-  **Cloud Files**: Integration with Cloud Files is supported via the API, however no development support is offered to help utilize Cloud Files via the API.
-  **DNS**: Rackspace supports the use of the public Rackspace nameservers for DNS. Bind/named are *not* supported at this time.
-  **Firewall**: Support is provided for iptables, Ubuntu ufw, and fail2ban.
-  **Load Balancing**: Cloud Load Balancers are supported by Fanatical Support® for Linux.

### Third Party Repositories

Fanatical Support® for Linux will, under reasonable endeavors and without warranty, configure repository access and install any packages from the following list of supported repositories. Some of the following repositories are also mirrored local to our data centers.

- [EPEL](http://fedoraproject.org/wiki/EPEL)
- [IUS](https://ius.io/)
- [MariaDB (vendor)](https://downloads.mariadb.org/mariadb/repositories/#mirror=osuosl)
- [MySQL (vendor)](https://dev.mysql.com/downloads/repo/)
- [Nginx (vendor)](https://www.nginx.com/resources/wiki/start/topics/tutorials/install/)
- [Percona (vendor)](https://www.percona.com/doc/percona-server/LATEST/installation.html#installing-percona-server-from-repositories)
- [Varnish (vendor)](https://www.varnish-cache.org/releases/install_redhat.html)

#### Disclaimer

**The information contained in this document is a general introduction to the Rackspace Services and does not include any legal commitment on the part of Rackspace.**

You should not rely solely on this document to decide whether to purchase the service. Rackspace detailed services descriptions and legal commitments are stated in its services agreements. Rackspace services’ features and benefits depend on system configuration and may require enabled hardware, software or additional services activation.

Except as set forth in Rackspace general terms and conditions, cloud terms of services and/or other agreements you sign with Rackspace, Rackspace assumes no liability whatsoever, and disclaims any express or implied warranty, relating to its services including, but not limited to, the implied warranty of merchantability, fitness for a particular purpose, and no infringement.

Although part of the document explains how Rackspace services may work with third party products, the information contained in the document is not designed to work with all scenarios. Any use or changes to third party product and/or configurations should be made at the discretion of your administrators and subject to the applicable terms and conditions of such third party. Rackspace does not provide technical support for third party products, other than specified in your hosting services or other agreement you have with Rackspace and Rackspace accepts no responsibility for third-party products.

Rackspace cannot guarantee the accuracy of any information presented after the date of publication. Copyright &copy; 2016 Rackspace | Rackspace&reg;, Fanatical Support&reg; and other Rackspace marks are either registered service marks or service marks of Rackspace US, Inc. in the United States and other countries. All other trademarks, service marks, images, products and brands remain the sole property of their respective holders and do not imply endorsement or sponsorship.
