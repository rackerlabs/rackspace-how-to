---
permalink: linux-spheres-of-support-for-dedicated-and-managed-ops/
audit_date: '2017-03-07'
title: Linux Spheres of Support for Dedicated and Managed Operations
type: article
created_date: '2017-03-03'
created_by: Alex Juarez
last_modified_date: '2017-06-02'
last_modified_by: Alex Juarez
product: Dedicated Hosting
product_url: dedicated-hosting
---

This article outlines our ***Fanatical Support&reg;*** of software and server configurations for machines (virtual and physical) running a supported Linux operating system.

### Operating systems

The following operating systems are supported for both Dedicated and Managed Operations:

- CentOS 7
- CentOS 6
- Red Hat Enterprise Linux 7
- Red Hat Enterprise Linux 6
- Ubuntu 16.04 LTS (Xenial Xerus)
- Ubuntu 14.04 LTS (Trusty Tahr)

The following operating systems are supported only for Managed Operations:

- Debian 8 (Jessie)
- Debian 7 (Wheezy)

**Note**: Rackspace makes every effort to align our support dates for operating systems with the manufacturer's support dates. If a manufacturer decides to shorten the support life of an operating system, Rackspace might be forced to end support sooner than originally anticipated. For full details on support life, see the [Rackspace EOL Terms](https://www.rackspace.com/information/legal/eolterms).

### Web servers

The following types of web servers are supported in the indicated areas:

|   | Installation | Configuration | Troubleshooting | Patching |
| --- | --- | --- | --- | --- |
| Apache | Yes | Yes | Yes | Yes |
| NGINX | Yes | Yes | Yes | Yes |

**Note**: Not all add-on modules are supported. Contact Rackspace Support for more information.

### Database servers

The following types of database servers are supported in the indicated areas:

|   | Installation | Configuration | Troubleshooting | Patching |
| --- | --- | --- | --- | --- |
| MySQL and MariaDB | Yes | Yes | Yes | Yes |
| Percona | Yes | Yes | Yes | Yes |

**Note**: Linux OS administrators handle basic database support topics. Advanced topics might require DBA support assistance. PostgreSQL, MongoDB, and Oracle are not supported by Linux OS administrators. The Rackspace DBA team supports Oracle and MySQL. PostgreSQL requests can be considered on a case-by-case basis. The Rackspace DBA team is available for support consultation on database issues; fees might apply. For more information visit our [DBA Services page](https://www.rackspace.com/en-us/dba-services).

**Note**: Rackspace will install and support the official Oracle MySQL, MariaDB and Percona MySQL
software from the vendor's repositories.

### File servers

The following file servers are supported in the indicated areas:

|   | Installation | Configuration | Troubleshooting | Patching |
| --- | --- | --- | --- | --- |
| vsftpd | Yes | Yes | Yes | Yes |
| NFS | Yes | Yes | Yes | Yes |
| CIFS (client) | Yes | Yes | Yes | Yes |
| lsyncd | Yes | Yes | Yes | Yes |

**Note**: Although lsyncd is not strictly a file server technology, we commonly use it at Rackspace in place of NFS services on cloud servers. Bidirectional data transfer with lsyncd is not supported.

### Mail servers

The following mail servers are supported in the indicated areas:

|   | Installation | Configuration | Troubleshooting | Patching |
| --- | --- | --- | --- | --- |
| Postfix | Yes | Yes | Yes | Yes |
| Dovecot | Yes | Yes | Yes | Yes |

**Note**: By their nature, cloud servers have ephemeral IP addresses which most email providers blacklist. Emails sent from a cloud server must go through a third-party application such as [Mailgun](https://www.mailgun.com/). Rackspace does not support mail hosting services on cloud servers and recomends [Rackspace Email Hosting](https://www.rackspace.com/en-us/email-hosting) for cloud environments.

### Application servers

The following authentication tools are supported in the indicated areas:

|   | Installation | Configuration | Troubleshooting | Patching |
| --- | --- | --- | --- | --- |
| SSSD-AD | Yes | Yes | Yes | Yes |
| Duo 2FA | Yes | Yes | Yes | Yes |

### Caching

The following caching tools are supported in the indicated areas:

|   | Installation | Configuration | Troubleshooting | Patching |
| --- | --- | --- | --- | --- |
| Memcached | Yes | Yes | Yes | Yes |
| Redis | Yes | Yes | Yes | Yes |
| Varnish | Yes | Yes | Yes | Yes |

**Note**: Rackspace does not support VCL customization for Varnish.

### Clustering

The following services are supported on Red Hat Cluster Suite (RHCS) in the indicated areas:

|   | Installation | Configuration | Troubleshooting | Patching |
| --- | --- | --- | --- | --- |
| MySQL, MariaDB, and Percona | Yes | Yes | Yes | Yes |
| NFS | Yes | Yes | Yes | Yes |
| Redis | Yes | Yes | Yes | Yes |

**Note**: RHCS is supported only on physical hardware platforms (not including OnMetal offerings). Oracle on RHCS is supported in tandem by the DBA team and Linux OS administrators.

### Control panels

The following control panel is supported in the indicated area:

|   | Installation | Configuration | Troubleshooting | Patching |
| --- | --- | --- | --- | --- |
| Plesk | Yes | Yes | Yes | Yes |

**Note**: Plesk is supported only on dedicated Red Hat Enterprise Linux and CentOS platforms.

### Antivirus

The following antivirus software is supported in the indicated areas:

|   | Installation | Configuration | Troubleshooting | Patching |
| --- | --- | --- | --- | --- |
| Rackspace Managed Anti-Virus | Yes | Yes | Yes | Yes |

**Note**: Rackspace requires the use of antivirus software on any configurations that use domain controllers and to assist in maintaining PCI compliance.

### Other services and technologies

Although we don't support all technologies, we do offer *reasonable endeavor* support, which extends our support into offering alternative solutions. Reasonable endeavor support can include help from Rackspace partners and other third-party services.

- **API support**: All the support functions listed in the [API guides](https://developer.rackspace.com/docs) are supported.
- **Backups**: Rackspace provides solutions for file system and database backups including leveraging the use of open-source projects such as [Holland](http://docs.hollandbackup.org/). For more information, contact Support.
-  **Cloud Files**: Integration with Cloud Files is supported via the API; however, no development
   support is offered to help use Cloud Files via the API.
-  **DNS**: Rackspace supports the use of the public Rackspace name servers for DNS. Bind/named are *not* supported at this time.
-  **Firewall**: Support is provided for iptables, Ubuntu ufw, and fail2ban.
-  **Load Balancing**: Cloud Load Balancers are supported.

### Third-party repositories

Fanatical Support for Linux will, under reasonable endeavors and without warranty, configure repository access and install any packages from the following list of supported repositories. Some of the following repositories are also mirrored locally to our data centers.

- [EPEL](http://fedoraproject.org/wiki/EPEL)
- [IUS](https://ius.io/)
- [MariaDB (vendor)](https://downloads.mariadb.org/mariadb/repositories/#mirror=osuosl)
- [MySQL (vendor)](https://dev.mysql.com/downloads/repo/)
- [NGINX (vendor)](https://www.nginx.com/resources/wiki/start/topics/tutorials/install/)
- [Percona (vendor)](https://www.percona.com/doc/percona-server/LATEST/installation.html#installing-percona-server-from-repositories)
- [Varnish (vendor)](https://www.varnish-cache.org/releases/install_redhat.html)

_When packages from 3rd party vendors are installed, customers are responsible for vendor escalation,
patching, and updates._

#### Disclaimer

**The information contained in this document is a general introduction to the Rackspace Services and does not include any legal commitment on the part of Rackspace.**

You should not rely solely on this document to decide whether to purchase the service. Rackspace detailed services descriptions and legal commitments are stated in its services agreements. Rackspace services’ features and benefits depend on system configuration and may require enabled hardware, software or additional services activation.

Except as set forth in Rackspace general terms and conditions, cloud terms of services and/or other agreements you sign with Rackspace, Rackspace assumes no liability whatsoever, and disclaims any express or implied warranty, relating to its services including, but not limited to, the implied warranty of merchantability, fitness for a particular purpose, and no infringement.

Although part of the document explains how Rackspace services may work with third party products, the information contained in the document is not designed to work with all scenarios. Any use or changes to third party product and/or configurations should be made at the discretion of your administrators and subject to the applicable terms and conditions of such third party. Rackspace does not provide technical support for third party products, other than specified in your hosting services or other agreement you have with Rackspace and Rackspace accepts no responsibility for third-party products.

Rackspace cannot guarantee the accuracy of any information presented after the date of publication. Copyright &copy; 2016 Rackspace &#124; Rackspace&reg;, Fanatical Support&reg; and other Rackspace marks are either registered service marks or service marks of Rackspace US, Inc. in the United States and other countries. All other trademarks, service marks, images, products and brands remain the sole property of their respective holders and do not imply endorsement or sponsorship.
